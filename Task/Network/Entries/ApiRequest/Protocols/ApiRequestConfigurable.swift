protocol ApiRequestConfigurable {
    var httpMethod: String { get }
    var allHTTPHeaderFields: [String : String] { get }
}
