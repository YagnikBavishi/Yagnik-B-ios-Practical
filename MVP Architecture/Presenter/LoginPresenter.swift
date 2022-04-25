//
//  LoginPresenter.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 12/04/22.
//

import Foundation
import Alamofire

protocol LoginSuccess {
    func loginSuccessful()
    func loginUnsuccessful()
}

class LoginPresenter {
    
    // MARK: - Variables
    var presentAlert: LoginSuccess?
    var userEmail: String = ""
    var userPassword: String = ""
    
    // MARK: - Initializer
    init(view: LoginSuccess){
        self.presentAlert = view
    }
    
    // MARK: - Class Functions
    func login() {
        if let url = URL(string: "https://reqres.in/api/login") {
            let userModel = UserLogin(email: userEmail , password: userPassword )
            let parameter = ["email": userModel.email, "password": userModel.password]
            AlamofireRequest.alamofireRequest(withURl: url, httpMethod: .post, withParameter: parameter, decodingType: ResponseToken.self, withEncoding: JSONEncoding.default) { [weak self] (responseData) in
                guard let self = self else {
                    return
                }
                if responseData != nil {
                    self.presentAlert?.loginSuccessful()
                } else {
                    self.presentAlert?.loginUnsuccessful()
                }
            }
        }
    }
    
}// End of Class
