import Foundation
import UIKit

class FirstViewControllerCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let firstViewController = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController {
            firstViewController.coordinator = self
            navController?.pushViewController(firstViewController, animated: true)
        }
    }
    
    func goToSecondViewController(message: String, delegate: DataPassingDelegate) {
        if let navController = navController {
            let secondCoordinator = SecondViewControllerCoordinator(navController)
            secondCoordinator.startWithData(message, delegate)
        }
    }
    
    func finish() {
        
    }
    
    func finishToRoot() {
        
    }
    
}// End of class
