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
        networking.request(apiRequest: apiRequest) { (_) in
            fatalError("TODO: Implement servers parsing")
        }
    }
}
