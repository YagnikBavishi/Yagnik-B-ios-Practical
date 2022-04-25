import Foundation

struct UserLogin: Codable {
    
    var email: String
    var password: String
    
}// End of Struct

struct ResponseToken: Codable {
    
    let token: String
    
}// End of Struct
