import UIKit

class SignUpPageViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var lblSignUp: UILabel!
    
    //MARK: - UIViewControllers
    override func viewDidLoad() {
        super.viewDidLoad()
        addGuesture()
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

