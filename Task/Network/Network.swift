import Foundation

class Network: Networking {
    // MARK: - Methods
    // MARK: - Networking
    func request(apiRequest: ApiRequest, completion: @escaping ((Result<Data, Error>) -> Void)) {
        guard let urlRequest = self.urlRequest(from: apiRequest) else {
            return
        }
        let urlSession = self.urlSession(apiRequest: apiRequest)
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
    
    // MARK: - Helpers
    private func urlRequest(from apiRequest: ApiRequest) -> URLRequest? {
        guard let url = URL(string: apiRequest.urlString) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.httpMethod
        return request
    }
    
    private func urlSession(apiRequest: ApiRequest) -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = apiRequest.allHTTPHeaderFields
        return URLSession(configuration: configuration)
    }
}
