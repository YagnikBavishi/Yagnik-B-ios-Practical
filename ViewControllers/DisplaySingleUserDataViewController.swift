import UIKit

class DisplaySingleUserDataViewController: UIViewController, Storyboarded {
    
    //MARK: - Outlets
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblFirstAndLastName: UILabel!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet weak var btnRssParser: UIButton!
    
    //MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    var id: Int?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        getData()
    }
    
    //MARK: - Actions
    @IBAction func goRSSParserScreen(_ sender: UIButton) {
        coordinator?.startRSSFeedViewController()
    }
    
    //MARK: - File Private Functions
    fileprivate func initialSetUp() {
        imgProfile.layer.borderWidth = CGFloat(Constant.TWO)
        imgProfile.layer.borderColor = UIColor.black.cgColor
        imgProfile.layer.cornerRadius = imgProfile.frame.height / 2
    }
    
    fileprivate func getData() {
        if let url = URL(string: "https://reqres.in/api/users/\(id ?? Constant.ZERO)") {
            let urlRequest = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in
                guard let responseData = data else {
                    return
                }
                print("Data is..\(responseData)")
                
                if let urlResponse = urlResponse {
                    print("URL Response...\(urlResponse)")
                }
                
                if let error = error {
                    print("Error...\(error.localizedDescription)")
                }
                
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(SingleUser.self, from: responseData)
                    DispatchQueue.main.async {
                        self?.lblEmail.text = userResponse.data.email
                        self?.lblFirstAndLastName.text = userResponse.data.firstName + " " + userResponse.data.lastName
                        if let url = URL(string: userResponse.data.avatar) {
                            if let data = try? Data(contentsOf: url) {
                                self?.imgProfile.image = UIImage(data: data)
                            }
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }; dataTask.resume()
        }
    }
    
}// End of Class
