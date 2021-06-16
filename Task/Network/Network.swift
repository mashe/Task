import Foundation

class Network: Networking {
    // MARK: - Methods
    // MARK: - Networking
    func request(apiRequest: ApiRequest, completion: @escaping ((Result<Data, Error>) -> Void)) {
        guard let urlRequest = self.urlRequest(from: apiRequest) else {
            return
        }
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = apiRequest.allHTTPHeaderFields
        let urlSession = URLSession(configuration: configuration)
        urlSession.configuration.httpAdditionalHeaders = apiRequest.allHTTPHeaderFields
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            print("\(Self.self) statusCode: \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
//            print("\(Self.self) response: \(String(describing: response))")
            print("\(Self.self) data: \(String(describing: data))")
            print("\(Self.self) error: \(String(describing: error))")
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
}
