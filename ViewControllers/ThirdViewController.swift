import UIKit

class ThirdViewController: UIViewController {

    //MARK: - Variables
    var coordinator: ThirdViewControllerCoordinator?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    //MARK: - File Private Functions
    fileprivate func initialSetUp() {
        self.title = "ThirdVC"
        self.navigationItem.backButtonTitle = "Back"
    }
    
    //MARK: - Actions
    @IBAction func popToFirstViewController(_ sender: UIButton) {
        coordinator?.finishToRoot()
    }
    
    @IBAction func goToSecondViewController(_ sender: Any) {
        coordinator?.finish()
    }
    
}//End of Class
