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
        self.hideKeyboardWhenTapAround() 
    }
    
    func registerUser(user: UserLogin) {
        if let url = URL(string: "https://reqres.in/api/login") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            } catch let error {
                Alerts.customAlert(message: "Unsuccess", body: "\(error.localizedDescription)", viewController: self)
            }
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, urlResponse, error) in
                guard let responseData = data else {
                    return
                }
                if let error = error {
                    Alerts.customAlert(message: error.localizedDescription, body: "", viewController: self ?? UIViewController())
                }
                
                do {
                    let decoder = JSONDecoder()
                    let _ = try decoder.decode(ResponseToken.self, from: responseData)
                    DispatchQueue.main.async {
                        self?.coordinator?.startTableViewWithAlamofireViewController(message: "URL Session")
                    }
                } catch let error {
                    Alerts.customAlert(message: "Unsuccess", body: "\(error.localizedDescription)", viewController: self ?? UIViewController())
                }
            }
            dataTask.resume()
        }
    }
    
    func loginWithAlamofire(user: UserLogin) {
        if let url = URL(string: "https://reqres.in/api/login") {
            let parameter = ["email": user.email, "password": user.password]
            AlamofireRequest.alamofireRequest(withURl: url, httpMethod: .post, withParameter: parameter, decodingType: ResponseToken.self, withEncoding: JSONEncoding.default) { [weak self] (responseData) in
                guard let self = self else {
                    return
                }
                if responseData != nil {
                    Alerts.customAlert(message: "Success", body: "", viewController: self)
                    self.coordinator?.startTableViewWithAlamofireViewController(message: "Alamofire")
                } else {
                    Alerts.customAlert(message: "Unsuccess", body: "", viewController: self)
                }
            }
        }
    }
    
    func validateData(_ email: String, _ password: String, _ flag: Bool ) {
        if email.isEmpty {
            Alerts.customAlert(message: "", body: "Empty Email", viewController: self)
        } else if password.isEmpty  {
            Alerts.customAlert(message: "", body: "Empty Password", viewController: self)
        } else if email == "eve.holt@reqres.in" && password == "cityslicka" {
            flag == true ? registerUser(user: user) : loginWithAlamofire(user: user)
            Alerts.customAlert(message: "Success", body: "", viewController: self)
        } else {
            Alerts.customAlert(message: "Unsuccess", body: "", viewController: self)
        }
    }
    
    //MARK: - Actions
    @IBAction func btnBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerUser(_ sender: UIButton) {
        user.email = tfEmail.text ?? ""
        user.password = tfPassword.text ?? ""
        validateData(user.email, user.password, true)
    }
    
    @IBAction func loginWithAlamofire(_ sender: UIButton) {
        user.email = tfEmail.text ?? ""
        user.password = tfPassword.text ?? ""
        validateData(user.email, user.password, false)
    }
    
}// End of Class

// MARK: - UITextFieldDelegate
extension LoginScreenWithApiCallViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        default:
           self.tfPassword.resignFirstResponder()
        }
        return true
    }

}// End of Extension
