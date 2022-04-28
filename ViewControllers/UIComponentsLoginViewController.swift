import UIKit

class UIComponentsLoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTapAround()
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
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        if let response = validateFields() {
            Alerts.customAlert(message: response, body:"" , viewController: self)
        } else {
            activityIndicator.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
                self.performSegue(withIdentifier: "tabView", sender: self)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
}//End of Class

// MARK: - UITextFieldDelegate
extension UIComponentsLoginViewController: UITextFieldDelegate {

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
