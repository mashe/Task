class DefaultServerService: ServerService {
    // MARK: - Variables
    private let remoteService: ServerRemoteService
    
    // MARK: - Methods
    init(remoteService: ServerRemoteService) {
        self.remoteService = remoteService
    }
    // MARK: - ServerService
    func fetchedRemoteServers(completion: @escaping ((Result<[Server], Error>) -> Void)) {
        remoteService.fetchedServers(completion: completion)
    }
}
