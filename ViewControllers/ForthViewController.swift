import UIKit

class ForthViewController: UIViewController {

    //MARK: - Variables
    var coordinator: ForthViewControllerCoordinator?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    //MARK: - File Private Functions
    fileprivate func initialSetUp() {
        self.title = "ForthVC"
        self.navigationItem.backButtonTitle = "Back"
    }
    
    //MARK: - Actions
    @IBAction func dimissForthViewController(_ sender: Any) {
        coordinator?.finish()
    }
    
    @IBAction func goToFifthViewController(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FifthViewController")
        viewController.modalPresentationStyle = .popover
        viewController.popoverPresentationController?.sourceView = sender
        viewController.popoverPresentationController?.permittedArrowDirections = .up
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func showFifthViewController(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Navigation", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FifthViewController")
        let popController = viewController.popoverPresentationController
        popController?.permittedArrowDirections = .right
        popController?.barButtonItem = sender
        self.present(viewController, animated: true, completion: nil)
    }
    
}// End of class
