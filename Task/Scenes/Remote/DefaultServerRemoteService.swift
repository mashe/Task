import Foundation

class DefaultServerRemoteService: ServerRemoteService {
    // MARK: - Variables
    private let networking: Networking
    
    // MARK: - Methods
    init(networking: Networking) {
        self.networking = networking
    }
    
    // MARK: - ServerRemoteService
    func fetchedServers(completion: @escaping ((Result<[Server], Error>) -> Void)) {
        let apiRequest = ApiRequest(
            methodType: .get,
            urlString: "http://playground.tesonet.lt/v1/servers",
            shouldAddAuthorizationHeader: true
        )
        networking.request(apiRequest: apiRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let servers = try JSONDecoder().decode(Array<Server>.self, from: data)
                    completion(.success(servers))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
