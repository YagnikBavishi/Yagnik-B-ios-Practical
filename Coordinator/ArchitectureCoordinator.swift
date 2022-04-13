//
//  ArchitectureCoordinator.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 13/04/22.
//

import Foundation
import UIKit

class ArchitectureCoordinator: Coordinator {
    
    var navController: UINavigationController?
    let userDefaults = UserManager()
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        userDefaults.isUserLogin ? goToUserListVC() : goToMVVMArchitecture()
    }
    
    func goToArchitecture() {
        let architectureViewController = ArchitectureViewController.instantiate(from: .architectureStoryBoard)
        architectureViewController.coordinator = self
        navController?.pushViewController(architectureViewController, animated: true)
    }
    
    func goToMVCArchitecture() {
        let mvcArchitectureViewController = MVCViewController.instantiate(from: .mvcStoryboard)
        mvcArchitectureViewController.coordinator = self
        navController?.pushViewController(mvcArchitectureViewController, animated: true)
    }
    
    func goToMVPArchitecture() {
        let mvpArchitectureViewController = LoginViewController.instantiate(from: .mvpStoryboard)
        mvpArchitectureViewController.coordinator = self
        navController?.pushViewController(mvpArchitectureViewController, animated: true)
    }
    
    func goToMVVMArchitecture() {
        let mvvmArchitectureViewController = MVVMLoginViewController.instantiate(from: .mvvmStoryboard)
        mvvmArchitectureViewController.coordinator = self
        navController?.pushViewController(mvvmArchitectureViewController, animated: true)
    }
    
    func backToMVVMArchitecture() {
        let mvvmArchitectureViewController = MVVMLoginViewController.instantiate(from: .mvvmStoryboard)
        mvvmArchitectureViewController.coordinator = self
        navController?.viewControllers = [mvvmArchitectureViewController]
    }
    
    func goToUserListVC() {
        let userListViewController = UserListViewController.instantiate(from: .mvvmStoryboard)
        userListViewController.coordinator = self
        navController?.pushViewController(userListViewController, animated: true)
    }
    
    func finish() {
        
    }
    
    func finishToRoot() {
        
    }

}// End of Class
