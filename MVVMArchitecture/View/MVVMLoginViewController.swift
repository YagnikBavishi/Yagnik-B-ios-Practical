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
        self.hideKeyboardWhenTapAround()
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
    
    fileprivate func validateData(_ email: String, _ password: String) {
        if email.isEmpty {
            Alerts.customAlert(message: "", body: "Empty Email", viewController: self)
        } else if password.isEmpty  {
            Alerts.customAlert(message: "", body: "Empty Password", viewController: self)
        } else if email == "eve.holt@reqres.in" && password == "cityslicka" {
            loginViewModel.login(email: tfEmail.text ?? "" , password: tfPassword.text ?? "")
            Alerts.customAlert(message: "Success", body: "", viewController: self)
        } else {
            Alerts.customAlert(message: "Unsuccess", body: "", viewController: self)
        }
    }
    
    // MARK: - Actions
    @IBAction func btnLoginAction(_ sender: UIButton) {
        validateData(tfEmail.text ?? "", tfPassword.text ?? "")
    }
    
}// End of class

// MARK: - UITextFieldDelegate
extension MVVMLoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        default:
           self.tfPassword.resignFirstResponder()
        }
        return true
    }

}// End of Extension
