import Foundation

struct ListOfUser: Codable {
    
    let page, perPage, total, totalPages: Int
    let data: [UserData]
    let support: Support
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
    
}// End of Struct

struct UserData: Codable {
    
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

struct Support: Codable {
    let url: String
    let text: String
}// End of Struct
