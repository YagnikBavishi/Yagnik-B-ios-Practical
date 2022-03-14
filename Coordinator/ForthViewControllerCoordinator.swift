import Foundation
import UIKit

class ForthViewControllerCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let forthViewController = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "ForthViewController") as? ForthViewController {
            forthViewController.coordinator = self
            navController?.pushViewController(forthViewController, animated: true)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }

}// End of class
