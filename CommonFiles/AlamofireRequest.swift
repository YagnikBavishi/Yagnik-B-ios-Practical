import Foundation
import Alamofire

class AlamofireRequest {
    
    //MARK: - Static Functions
    static func alamofireRequest(withURl url:URL, httpMethod method: HTTPMethod, withParameter parameter: Parameters? = nil, withEncoding encoding: ParameterEncoding, withHeaders headers: HTTPHeaders? = nil, completionHandler completion: @escaping (Data?) -> Void) {
        AF.request(url, method: method, parameters: parameter, encoding: encoding, headers: headers).response { data in
            guard data.data != nil else {
                return
            }
            switch data.result {
            case .success(let responseData):
                guard let responseData = responseData else {
                    return
                }
                guard let sucessCode = data.response?.statusCode else { return }
                if((200 ..< 299)) ~=  sucessCode {
                    completion(responseData)
                } else {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
    
}// End of Class
