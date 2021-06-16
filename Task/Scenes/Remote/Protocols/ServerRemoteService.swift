protocol ServerRemoteService {
    func fetchedServers(completion: @escaping ((Result<[Server], Error>) -> Void))
}
