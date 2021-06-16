extension ApiRequest: ApiRequestConfigurable {
    var httpMethod: String {
        switch methodType {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
    var allHTTPHeaderFields: [String : String] {
        return combinedHeaders
    }
    
    // MARK: - Helpers
    private var combinedHeaders: [String: String] {
        var defaultHeaders = [
            "Content-Type": "application/json",
        ]
        if let authorizationToken = authorizationToken {
            defaultHeaders["Authorization"] = "Bearer \(authorizationToken)"
        }
        if let additionalHeaders = headers {
            defaultHeaders.merge(additionalHeaders, uniquingKeysWith: { (_, new) in
                return new
            })
        }
        return defaultHeaders
    }
    
    private var authorizationToken: String? {
        return shouldAddAuthorizationHeader ? "f9731b590611a5a9377fbd02f247fcdf" : nil
    }
}
