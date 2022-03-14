import Foundation
import UIKit

class MainCoordinator: Coordinator {
  
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            navController?.pushViewController(mainViewController, animated: true)
        }
    }
    
    func finish() {
        
    }
    
    func finishToRoot() {
        
    }
    
}// End of class
