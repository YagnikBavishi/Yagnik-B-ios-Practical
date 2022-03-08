import UIKit

class LoginPageViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblLogin: UILabel!
    
    //MARK: - UIViewControllers
    override func viewDidLoad() {
        super.viewDidLoad()
        addGuesture()
    }
    
    //MARK: - Actions
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

