import UIKit

class FirstViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var tfSendMessage: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    //MARK: - Variables
    var coordinator: FirstViewControllerCoordinator?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tfSendMessage.text = ""
    }
    
    //MARK: - File Private Functions
    fileprivate func initialSetUp() {
        self.navigationItem.backButtonTitle = "Back"
        if let navController = self.navigationController {
            coordinator = FirstViewControllerCoordinator(navController)
        }
    }
    
    //MARK: - Actions
    @IBAction func goBackToHome(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToSecondViewController(_ sender: UIButton) {
        let textFieldmessage = tfSendMessage.text ?? "Empty"
        coordinator?.goToSecondViewController(message: textFieldmessage, delegate: self)
    }
    
}// End of Class

//MARK: - SecondViewControllerDetegate
extension FirstViewController: DataPassingDelegate {

    func dataPassing(_ message: String) {
        lblMessage.text = message
    }
    
}// End of Extension

// MARK: - UITextFieldDelegate
extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
} // End of Extension
