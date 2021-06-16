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
            headers: nil,
            shouldAddAuthorizationHeader: true
        )
        networking.request(apiRequest: apiRequest) { [weak self] (result) in
//            guard let self = self else {
//                return
//            }
//            switch result {
//            case .success(let data):
//                completion(.success([]))
//            case .failure(let error):
//                completion(.failure(error))
//            }
        }
    }
}
