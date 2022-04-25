import Foundation
import UIKit

class AuthenticationCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        let LoginScreenWithApiCallViewController = LoginScreenWithApiCallViewController.instantiate(from: .apiStoryBoard)
        LoginScreenWithApiCallViewController.coordinator = self
        navController?.pushViewController(LoginScreenWithApiCallViewController, animated: true)
    }
    
    func startTableViewWithAlamofireViewController(message: String) {
        let TableViewWithApiCallViewController = TableViewWithApiCallViewController.instantiate(from: .apiStoryBoard)
        TableViewWithApiCallViewController.coordinator = self
        TableViewWithApiCallViewController.message = message
        navController?.pushViewController(TableViewWithApiCallViewController, animated: true)
    }
    
    func startDisplaySingleUserDataViewController(id: Int) {
        let DisplaySingleUserDataViewController = DisplaySingleUserDataViewController.instantiate(from: .apiStoryBoard)
        DisplaySingleUserDataViewController.coordinator = self
        DisplaySingleUserDataViewController.id = id
        navController?.pushViewController(DisplaySingleUserDataViewController, animated: true)
    }
    
    func startRSSFeedViewController() {
        let RSSFeedViewController = RSSFeedViewController.instantiate(from: .apiStoryBoard)
        RSSFeedViewController.coordinator = self
        navController?.pushViewController(RSSFeedViewController, animated: true)
    }
    
    func backToLoginScreen() {
        navController?.popViewController(animated: true)
    }
    
    func finish() {
        
    }
    
    func finishToRoot() {
        
    }
    
}// End of class
