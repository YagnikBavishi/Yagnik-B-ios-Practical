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
    }
    
    // MARK: - Actions
    @IBAction func btnLoginAction(_ sender: UIButton) {
        loginPresenter.userEmail = tfEmail.text ?? ""
        loginPresenter.userPassword = tfPassword.text ?? ""
        loginPresenter.login()
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
