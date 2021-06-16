struct ApiRequest {
    let methodType: HttpMethodType
    let urlString: String
    let headers: [String: String]?
    let shouldAddAuthorizationHeader: Bool

    init(methodType: HttpMethodType,
         urlString: String,
         headers: [String: String]? = nil,
         shouldAddAuthorizationHeader: Bool = true) {
        self.methodType = methodType
        self.urlString = urlString
        self.headers = headers
        self.shouldAddAuthorizationHeader = shouldAddAuthorizationHeader
    }
}
