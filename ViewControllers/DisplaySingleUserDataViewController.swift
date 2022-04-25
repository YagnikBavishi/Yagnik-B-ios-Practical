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
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initialSetUp()
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
        self.imgProfile.clipsToBounds = true
    }
    
    fileprivate func getData() {
        if let url = URL(string: "https://reqres.in/api/users/\(id ?? Constant.ZERO)") {
            let urlRequest = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in
                guard let responseData = data else {
                    return
                }
                
                if let error = error {
                    Alerts.customAlert(message: "Unsuccess", body: "\(error.localizedDescription)", viewController: self ?? UIViewController())
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
                    Alerts.customAlert(message: "Unsuccess", body: "\(error.localizedDescription)", viewController: self ?? UIViewController())
                }
            }; dataTask.resume()
        }
    }
    
}// End of Class
