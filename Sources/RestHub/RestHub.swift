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
    
    open func getUser(withOAuthToken token: String, completion: @escaping (Result<User?, Error>) -> Void) {
        let userUrl = NetworkService.baseURL.appendingPathComponent("user")
        //TODO: Refactor NetworkService
        networkService.decodeCodableRequest(T: User.self, with: userUrl, token: token, method: .get, body: nil, completion: completion)
    }
    
    open func listRepos(_ username: String, completion: @escaping (Result<[Repo]?, Error>) -> Void) {
        let reposUrl = NetworkService.baseURL
            .appendingPathComponent("users")
            .appendingPathComponent(username)
            .appendingPathComponent("repos")
        
        networkService.decodeCodableRequest(T: [Repo].self, with: reposUrl, method: .get, body: nil, completion: completion)
    }
    
    open func listRepos(for username: String, withOAuthToken token: String, sort: SortBy? = nil, direction: SortDirection? = nil, perPage: Int = 100, type: RepoType, completion: @escaping(Result<[Repo]?, Error>) -> Void) {
        let reposUrl = NetworkService.baseURL
            .appendingPathComponent("users")
            .appendingPathComponent(username)
            .appendingPathComponent("repos")
        
        networkService.decodeCodableRequest(T: [Repo].self, with: reposUrl, token: token, method: .get, body: nil, completion: completion)
    }
}

public enum SortBy: String {
    case created, updated, pushed,
         fullName = "full_name"
}

public enum SortDirection: String {
    case asc, desc
}

public enum RepoType: String {
    case all, owner, member
}
