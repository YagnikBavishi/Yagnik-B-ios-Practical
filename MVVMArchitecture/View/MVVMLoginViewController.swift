//
//  MVVMLoginViewController.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 13/04/22.
//

import UIKit
import SwiftMessages

class MVVMLoginViewController: UIViewController, Storyboarded {

    // MARK: - Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    //MARK: - Variables
    var coordinator: ArchitectureCoordinator?
    var loginViewModel = LoginViewModel()
    let userDefaults = UserManager()
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    // MARK: - File Private Functions
    fileprivate func bindData() {
        loginViewModel.onLoginSuccess = { [weak self] in
            guard let self = self else {
                return
            }
            self.coordinator?.goToUserListVC()
        }
        
        loginViewModel.onLoginUnsuccess = { 
            Alerts.customAlert(message: "Unsuccess", body: "Login Unsucessful...", viewController: self)
        }
    }
    
    // MARK: - Actions
    @IBAction func btnLoginAction(_ sender: UIButton) {
        loginViewModel.login(email: tfEmail.text ?? "" , password: tfPassword.text ?? "")
    }
    
}// End of class
