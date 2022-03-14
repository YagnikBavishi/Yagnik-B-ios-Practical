import Foundation
import UIKit

class SecondViewControllerCoordinator: Coordinator {
        
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let secondViewController = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secondViewController.coordinator = self
            navController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    func startWithData(_ messageFormFirst: String, _ delegate: DataPassingDelegate) {
        if let secondViewController = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secondViewController.coordinator = self
            secondViewController.delegate = delegate
            secondViewController.message = messageFormFirst
            navController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    func goToThirdViewController() {
        if let navController = navController {
            let thirdCoordinator = ThirdViewControllerCoordinator(navController)
            thirdCoordinator.start()
        }
    }
    
    func goToForthViewController() {
        if let navController = navController {
            let forthCoordinator = ForthViewControllerCoordinator(navController)
            forthCoordinator.start()
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        
    }
    
}// End of class
