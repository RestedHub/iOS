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
    
    open func getUser(withOAuthToken token: String, completion: @escaping (Result<User, Error>) -> Void) {
        let userUrl = NetworkService.baseURL.appendingPathComponent("user")
        //TODO: Refactor NetworkService
        var request = URLRequest(url: userUrl)
        request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            let error = NSError(domain: "NetworkError", code: (response as? HTTPURLResponse)?.statusCode ?? 400, userInfo: ["NSLocalizedDescriptionKey" : "No Data From Network Request"])
            guard let data = data else {
                completion(.failure(error))
                return
            }
            
            guard let user = self.networkService.decode(to: User.self, data: data) else {
                let authError = NSError(domain: "AuthError", code: (response as? HTTPURLResponse)?.statusCode ?? 400, userInfo: ["NSLocalizedDescriptionKey" : String(data: data, encoding: .utf8)])
                completion(.failure(authError))
                return
            }
            completion(.success(user))
        }.resume()
    }
    
    open func listRepos(_ username: String, completion: @escaping (Result<[Repo]?, Error>) -> Void) {
        let reposUrl = NetworkService.baseURL
            .appendingPathComponent("users")
            .appendingPathComponent(username)
            .appendingPathComponent("repos")
        
        networkService.decodeCodableRequest(T: [Repo].self, with: reposUrl, method: .get, body: nil, completion: completion)
    }
    
    
}
