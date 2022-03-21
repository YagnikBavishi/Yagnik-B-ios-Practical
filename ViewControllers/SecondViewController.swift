import UIKit

//MARK: - Protocols
protocol DataPassingDelegate {
    
    func dataPassing(_ message: String)
    
}// End of Protocol

class SecondViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var tfSendMessage: UITextField!
    
    //MARK: - Variables
    var coordinator: SecondViewControllerCoordinator?
    var message: String?
    var delegate: DataPassingDelegate?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblMessage.text = message
    }
    
    //MARK: - File Private Functions
    fileprivate func initialSetUp() {
        self.title = "SecondVC"
        self.navigationItem.backButtonTitle = "Back"
    }
    
    //MARK: - Actions
    @IBAction func goToThirdViewController(_ sender: Any) {
        coordinator?.goToThirdViewController()
    }
    
    @IBAction func goToFirstViewController(_ sender: Any) {
        let textFieldmessage = tfSendMessage?.text ?? ""
        delegate?.dataPassing(textFieldmessage)
        coordinator?.finish()
    }
    
    @IBAction func goToForthViewController(_ sender: Any) {
        coordinator?.goToForthViewController()
    }
    
}// End of Class
