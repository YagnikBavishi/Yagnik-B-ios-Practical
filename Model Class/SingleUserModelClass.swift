import Foundation

struct SingleUserDataClass: Codable {
    
    let data: UserDataClass
    let support: SupportStruct
    
}// End of Struct

struct UserDataClass: Codable {
    
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
}// End of Struct

struct SupportStruct: Codable {
    let url: String
    let text: String
}// End of Struct
