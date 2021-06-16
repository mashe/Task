import Foundation

protocol Networking {
    func request(apiRequest: ApiRequest, completion: @escaping ((Result<Data, Error>) -> Void))
}
