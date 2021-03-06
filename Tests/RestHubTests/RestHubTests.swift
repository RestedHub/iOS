    import XCTest
    @testable import RestHub

    final class RestHubTests: XCTestCase {
        func testCanGetUser() {
            let expectation = self.expectation(description: "getFroggomad")
            let hub = RestHub()
            hub.getUser("froggomad") { (result) in
                defer { expectation.fulfill() }
                switch result {
                case .success(let user):
                    XCTAssertNotNil(user)
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
            }
            wait(for: [expectation], timeout: 10.0)
        }
        
        func testCanGetRepos() {
            let expectation = self.expectation(description: "getFroggomadRepos")
            let hub = RestHub()
            hub.listRepos("froggomad") { result in
                defer { expectation.fulfill() }
                switch result {
                case .success(let repos):
                    XCTAssertNotNil(repos)
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
            }
            wait(for: [expectation], timeout: 10.0)
        }
    }
