import Foundation

open class RestHub {
    // MARK: - Properties -
    private var networkService = NetworkService()
    public init() { }
    
    // MARK: - GET -
    open func getUser(_ username: String, completion: @escaping (Result<User?, Error>) -> Void) {
        let userUrl = NetworkService.baseURL.appendingPathComponent("users")
        networkService.decodeCodableRequest(T: User.self, with: userUrl.appendingPathComponent(username), method: .get, body: nil, completion: completion)
    }
    
    open func listRepos(_ username: String, completion: @escaping (Result<[Repo]?, Error>) -> Void) {
        let reposUrl = NetworkService.baseURL
            .appendingPathComponent("users")
            .appendingPathComponent(username)
            .appendingPathComponent("repos")
        
        networkService.decodeCodableRequest(T: [Repo].self, with: reposUrl, method: .get, body: nil, completion: completion)
    }
    
    
}
