import Foundation
import Alamofire

class AlamofireRequest {
    
    //MARK: - Static Functions
    static func alamofireRequest<T: Decodable>(withURl url:URL, httpMethod method: HTTPMethod, withParameter parameter: Parameters? = nil, decodingType: T.Type, withEncoding encoding: ParameterEncoding, withHeaders headers: HTTPHeaders? = nil, completionHandler completion: @escaping (T?) -> Void) {
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
                if ((200 ..< 299) ~=  sucessCode) {
                    do {
                        let decoder = JSONDecoder()
                        let userResponse = try decoder.decode(T.self, from: responseData)
                        completion(userResponse)
                    } catch {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
    
}// End of Class
