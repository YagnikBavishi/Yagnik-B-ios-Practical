//
//  UserListViewModel.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 14/04/22.
//

import Foundation
import Alamofire

class UserListViewModel {
    
    // MARK: - Variables
    var fetchedStudentData = [UserData]()
    var studentData: userDataCompletion?
    var dataLoaded: voidCompletion?
    var error: voidCompletion?
    
    // MARK: - Class Functions
    func getUserData() {
        if let url = URL(string: "https://reqres.in/api/users") {
            AlamofireRequest.alamofireRequest(withURl: url, httpMethod: .get, withParameter: nil, decodingType: ListOfUser.self, withEncoding: URLEncoding.default) { [weak self] (responseData) in
                guard let self = self else {
                    return
                }
                if let responseData = responseData {
                    for index in responseData.data {
                        self.fetchedStudentData.append(UserData(id: index.id, email: index.email, firstName: index.firstName, lastName: index.lastName, avatar: index.avatar))
                    }
                    self.studentData?(self.fetchedStudentData)
                    self.dataLoaded?()
                }
            }
        }
    }
    
}// End of class
