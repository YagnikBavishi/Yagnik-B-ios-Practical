//
//  LoginViewController.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 12/04/22.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {

    // MARK: - Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    //MARK: - Variables
    var coordinator: ArchitectureCoordinator?
    var user = UserLogin(email: "" , password: "")
    lazy var loginPresenter = LoginPresenter(view: self)
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTapAround()
    }
    
    // MARK: - File Private Functions
    fileprivate func validateData(_ email: String, _ password: String) {
        if email.isEmpty {
            Alerts.customAlert(message: "", body: "Empty Email", viewController: self)
        } else if password.isEmpty  {
            Alerts.customAlert(message: "", body: "Empty Password", viewController: self)
        } else if email == "eve.holt@reqres.in" && password == "cityslicka" {
            loginPresenter.userEmail = email
            loginPresenter.userPassword = password
            loginPresenter.login()
        } else {
            Alerts.customAlert(message: "Unsuccess", body: "", viewController: self)
        }
    }
    
    // MARK: - Actions
    @IBAction func btnLoginAction(_ sender: UIButton) {
        validateData(tfEmail.text ?? "", tfPassword.text ?? "")
    }
    
}// End of class

// MARK: - LoginSuccess Protocol
extension LoginViewController: LoginSuccess {
    
    func loginSuccessful() {
        Alerts.customAlert(message: "Success", body: "Login Successful..", viewController: self)
    }
    
    func loginUnsuccessful() {
        Alerts.customAlert(message: "Unsuccess", body: "Login Unsuccessful..", viewController: self)
    }
    
}// End of extension

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
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
