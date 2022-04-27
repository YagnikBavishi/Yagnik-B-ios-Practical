import UIKit

class LoginPageViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var tfFirstName: UITextField!
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
        if let firstName = tfFirstName.text, let email = tfEmail.text, let password = tfPassword.text {
            if(firstName.isEmpty) {
                return "First Name is Empty"
            } else if(email.isEmpty) {
                return "Email is Empty"
            } else if (!(email.contains(".")) || !(email.contains("@"))) {
                return "Wrong email"
            } else if(password.isEmpty) {
                return "Password is Empty"
            }
            return nil
        }
        return nil
    }
    
    // MARK: - Actions
    @IBAction func btnSignup(_ sender: UIButton) {
        response = validateFields()
        guard let response = response else {
            Alerts.customAlert(message: "Success", body:"" , viewController: self)
            return
        }
        Alerts.customAlert(message: response, body:"" , viewController: self)
    }

    @IBAction func goBackToHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}// End of class

//MARK: -  File Private Function
extension LoginPageViewController {
    
    fileprivate func addGuesture() {
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        lblLogin.isUserInteractionEnabled = true
        lblLogin.addGestureRecognizer(guestureRecognizer)
    }
    
    @objc func labelClicked(_ sender: Any) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpPageViewController") as? SignUpPageViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}// End of Extension

// MARK: - UITextFieldDelegate
extension LoginPageViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfFirstName:
            self.tfEmail.becomeFirstResponder()
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        default:
            self.tfPassword.resignFirstResponder()
        }
        return true
    }

}// End of Extension

