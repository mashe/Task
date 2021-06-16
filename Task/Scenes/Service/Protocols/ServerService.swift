protocol ServerService {
    func fetchedRemoteServers(completion: @escaping ((Result<[Server], Error>) -> Void))
}
