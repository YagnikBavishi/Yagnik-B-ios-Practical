import UIKit
import Alamofire

class LoginScreenWithApiCallViewController: UIViewController, Storyboarded {
    
    //MARK: - Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLoginWithURLSession: UIButton!
    @IBOutlet weak var btnLoginWithAlamofire: UIButton!
    
    //MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    var user = UserLogin(email: "" , password: "")
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    //MARK: - File Private Functions
    func initialSetUp() {
        if let navController = self.navigationController {
            coordinator = AuthenticationCoordinator(navController)
        }
    }
    
    func registerUser(user: UserLogin) {
        if let url = URL(string: "https://reqres.in/api/login") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            } catch let error {
                print("Error\(error.localizedDescription)")
            }
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in
                guard let responseData = data else {
                    return
                }
                print("Response Data is....\(responseData)")
                
                if let error = error {
                    print("Error...\(error.localizedDescription)")
                }
    
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(ResponseToken.self, from: responseData)
                    print("\(userResponse)")
                    DispatchQueue.main.async {
                        self?.coordinator?.startTableViewWithAlamofireViewController(message: "URL Session")
                    }
                } catch let error {
                    print("Error...\(error.localizedDescription)")
                }
            }
            dataTask.resume()
        }
    }
    
    func loginWithAlamofire(user: UserLogin) {
        if let url = URL(string: "https://reqres.in/api/login") {
            let parameter = ["email": user.email, "password": user.password]
            AlamofireRequest.alamofireRequest(withURl: url, httpMethod: .post, withParameter: parameter, withEncoding: JSONEncoding.default, viewController: self) { [weak self] (responseData) in
                self?.coordinator?.startTableViewWithAlamofireViewController(message: "Alamofire")
            }
        }
    }
    
    //MARK: - Actions
    @IBAction func registerUser(_ sender: UIButton) {
        user.email = tfEmail.text ?? ""
        user.password = tfPassword.text ?? ""
        registerUser(user: user)
    }
    
    @IBAction func loginWithAlamofire(_ sender: UIButton) {
        user.email = tfEmail.text ?? ""
        user.password = tfPassword.text ?? ""
        loginWithAlamofire(user: user)
    }
    
}// End of Class
