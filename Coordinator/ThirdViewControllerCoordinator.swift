import Foundation
import UIKit

class ThirdViewControllerCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let thirdViewController = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController {
            thirdViewController.coordinator = self
            navController?.pushViewController(thirdViewController, animated: true)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }

}// End of class
