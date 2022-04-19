//
//  LoginViewModel.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 13/04/22.
//

import Foundation
import Alamofire

class LoginViewModel {
    
    // MARK: - Variables
    var onLoginSuccess: voidCompletion?
    var onLoginUnsuccess: voidCompletion?
    
    // MARK: - Class Functions
    func login(email: String, password: String) {
        if let url = URL(string: "https://reqres.in/api/login") {
            let parameter = ["email": email, "password": password]
            AlamofireRequest.alamofireRequest(withURl: url, httpMethod: .post, withParameter: parameter, withEncoding: JSONEncoding.default) { [weak self] (responseData) in
                guard let self = self else {
                    return
                }
                if responseData != nil {
                    let userDefaults = UserManager()
                    userDefaults.isUserLogin = true
                    self.onLoginSuccess?()
                } else {
                    self.onLoginUnsuccess?()
                }
            }
        }
    }
    
}// End of Class
