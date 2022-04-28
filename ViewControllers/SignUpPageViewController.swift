import UIKit

class SignUpPageViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    // MARK: - Variables
    var response: String?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTapAround()
        addGuesture()
    }
    
    // MARK: - File Private Functions
    fileprivate func validateFields() -> String? {
        if let email = tfEmail.text, let password = tfPassword.text {
            if((email.isEmpty)) {
                return "Email is Empty"
            } else if (!(email.contains(".")) || !(email.contains("@"))) {
                return "Wrong email"
            } else if((password.isEmpty)) {
                return "Password is Empty"
            }
            return nil
        }
        return nil
    }
    
    // MARK: - Actions
    @IBAction func btnLogin(_ sender: UIButton) {
        response = validateFields()
        guard let response = response else {
            Alerts.customAlert(message: "Success", body:"" , viewController: self)
            return
        }
        Alerts.customAlert(message: response, body:"" , viewController: self)
    }
    
    @IBAction func goTosignUpScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}// End of class

//MARK: - File Priavte Functions
extension SignUpPageViewController {
    
    fileprivate func addGuesture() {
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signUpLabel(_:)))
        lblSignUp.isUserInteractionEnabled = true
        lblSignUp.addGestureRecognizer(guestureRecognizer)
    }
    
    @objc func signUpLabel(_ sender: Any) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginPageViewController") as? LoginPageViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}// End of Extension

// MARK: - UITextFieldDelegate
extension SignUpPageViewController: UITextFieldDelegate {

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
