//
//  MVCViewController.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 12/04/22.
//

import UIKit

class MVCViewController: UIViewController, Storyboarded {

    // MARK: - Outlets
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastAName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    // MARK: - Variables
    var coordinator: ArchitectureCoordinator?

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTapAround()
    }
  
    // MARK: - File Private Functions
    fileprivate func validateFields() -> String? {
        if let firstName = txtFirstName.text , let lastName = txtLastAName.text, let email = txtEmail.text {
            if((firstName.isEmpty)) {
                return "First Name is Empty"
            } else if(lastName.isEmpty) {
                return "Last Name is Empty"
            } else if(email.isEmpty) {
                return "Email is Empty"
            }
            return nil
        }
        return nil
    }
    
    // MARK: - Actions
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        if let response = validateFields() {
            Alerts.customAlert(message: response, body:"" , viewController: self)
        } else {
            if let firstName = txtFirstName.text, let lastName = txtLastAName.text {
                Alerts.customAlert(message: "Success", body: "\(firstName + " " + lastName)", viewController: self)
            }
        }
    }
    
}// End of Class

// MARK: - UITextFieldDelegate
extension MVCViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.txtFirstName:
            self.txtLastAName.becomeFirstResponder()
        case self.txtLastAName:
            self.txtEmail.becomeFirstResponder()
        default:
           self.txtEmail.resignFirstResponder()
        }
        return true
    }

}// End of Extension
