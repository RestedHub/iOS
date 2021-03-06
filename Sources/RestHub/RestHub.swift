import Foundation

open class RestHub {
    // MARK: - Properties -
    private var networkService = NetworkService()
    public init() { }
    
    // MARK: - GET -
    open func getUser(_ username: String, completion: @escaping (Result<User?, Error>) -> Void) {
        networkService.decodeCodableRequest(T: User.self, with: URL(string: "https://api.github.com/users/\(username)")!, method: .get, body: nil, completion: completion)
    }
}
