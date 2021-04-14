//
//  File.swift
//  
//
//  Created by Kenneth Dubroff on 3/5/21.
//

import Foundation

public struct User: Codable, Equatable {
    
   public let username: String?
   public let id: Int?
   public let nodeId: String?
   public let avatarUrl: URL?
   public let gravatarId: String?
   public let url: URL?
   public let htmlUrl: URL?
   public let followersUrl: URL?
   public let followingUrl: String?
   public let gistsUrl: String?
   public let starredUrl: String?
   public let subscriptionsUrl: URL?
   public let organizationsUrl: URL?
   public let reposUrl: URL?
   public let eventsUrl: String?
   public let receivedEventsUrl: URL?
   public let type: String?
   public let siteAdmin: Bool?
   public let name: String?
   public let company: String?
   public let blog: URL?
   public let location: String?
   public let email: String?
   public let hireable: Bool?
   public let bio: String?
   public let twitterUsername: String?
   public let numPublicRepos: Int?
   public let numPublicGists: Int?
   public let numFollowers: Int?
   public let numFollowing: Int?
   public let createdAt: Date?
   public let updatedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case username = "login"
        case id
        case nodeId
        case avatarUrl
        case gravatarId
        /// public url
        case url
        /// personal url
        case htmlUrl
        case followersUrl
        case followingUrl
        case gistsUrl
        case starredUrl
        case subscriptionsUrl
        case organizationsUrl
        case reposUrl
        case eventsUrl
        case receivedEventsUrl
        case type
        case siteAdmin
        case name
        case company
        case blog
        case location
        case email
        case hireable
        case bio
        case twitterUsername
        case numPublicRepos = "publicRepos"
        case numPublicGists = "publicGists"
        case numFollowers = "followers"
        case numFollowing = "following"
        case createdAt
        case updatedAt
    }

}
// MARK: - Repo -
public struct Repo: Codable {
    public let id: Int?
    public let nodeId: String?
    public let name: String?
    public let `private`: Bool?
    public let owner: User?
    /// public URL
    public let htmlUrl: String?
    public let repoDescription: String?
    public let fork: Bool?
    /// API URL
    public let url: URL?
    public let forksUrl: URL?
    public let keysUrl: String?
    public let collaboratorsUrl: String?
    public let teamsUrl: URL?
    public let hooksUrl: URL?
    public let issueEventsUrl: String?
    public let eventsUrl: URL?
    public let assigneesUrl: String?
    public let branchesUrl: String?
    public let tagsUrl: URL?
    public let blobsUrl: String?
    public let gitTagsUrl: String?
    public let gitRefsUrl: String?
    public let treesUrl: String?
    public let statusesUrl: String?
    public let languagesUrl: URL?
    public let stargazersUrl: URL?
    public let contributorsUrl: URL?
    public let subscribersUrl: URL?
    public let subscriptionUrl: URL?
    public let commitsUrl: String?
    public let gitCommitsUrl: String?
    public let commentsUrl: String?
    public let issueCommentUrl: String?
    public let contentsUrl: String?
    public let compareUrl: String?
    public let mergesUrl: URL?
    public let archiveUrl: String?
    public let downloadsUrl: URL?
    public let issuesUrl: String?
    public let pullsUrl: String?
    public let milestonesUrl: String?
    public let notificationsUrl: String?
    public let labelsUrl: String?
    public let releasesUrl: String?
    public let deploymentsUrl: URL?
    public let createdAt: Date?
    public let pushedAt: Date?
    public let gitUrl: URL?
    public let sshUrl: URL?
    public let cloneUrl: URL?
    public let svnUrl: URL?
    public let homepage: String?
    public let size: Int?
    public let stargazersCount: Int?
    public let watchersCount: Int?
    public let language: String?
    public let hasIssues: Bool?
    public let hasProjects: Bool?
    public let hasDownloads: Bool?
    public let hasWiki: Bool?
    public let hasPages: Bool?
    public let forksCount: Int?
    public let mirrorUrl: URL?
    public let archived: Bool?
    public let disabled: Bool?
    public let openIssuesCount: Int?
    public let license: License?
    public let forks: Int?
    public let openIssues: Int?
    public let watchers: Int?
    public let defaultBranch: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeId
        case name
        case `private` = "private"
        case owner
        /// public URL
        case htmlUrl
        case repoDescription = "description"
        case fork
        /// API URL
        case url
        case forksUrl
        case keysUrl
        case collaboratorsUrl
        case teamsUrl
        case hooksUrl
        case issueEventsUrl
        case eventsUrl
        case assigneesUrl
        case branchesUrl
        case tagsUrl
        case blobsUrl
        case gitTagsUrl
        case gitRefsUrl
        case treesUrl
        case statusesUrl
        case languagesUrl
        case stargazersUrl
        case contributorsUrl
        case subscribersUrl
        case subscriptionUrl
        case commitsUrl
        case gitCommitsUrl
        case commentsUrl
        case issueCommentUrl
        case contentsUrl
        case compareUrl
        case mergesUrl
        case archiveUrl
        case downloadsUrl
        case issuesUrl
        case pullsUrl
        case milestonesUrl
        case notificationsUrl
        case labelsUrl
        case releasesUrl
        case deploymentsUrl
        case createdAt
        case pushedAt
        case gitUrl
        case sshUrl
        case cloneUrl
        case svnUrl
        case homepage
        case size
        case stargazersCount
        case watchersCount
        case language
        case hasIssues
        case hasProjects
        case hasDownloads
        case hasWiki
        case hasPages
        case forksCount
        case mirrorUrl
        case archived
        case disabled
        case openIssuesCount
        case license
        case forks
        case openIssues
        case watchers
        case defaultBranch
    }
}

// MARK: - License -
public struct License: Codable {
    public let key: String?
    public let name: String?
    public let spdxId: String?
    public let url: URL?
    public let nodeId: String?
}


extension Repo: CustomStringConvertible {
    public var description: String {
        do {
        let jsonEncoder = JSONEncoder()
        let data = try jsonEncoder.encode(self)
            return data.prettyPrintedJSONString ?? ""
        } catch {
            return error.localizedDescription
        }
    }
}


extension Data {
    var prettyPrintedJSONString: String? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding: String.Encoding.utf8) else { return nil }

        return prettyPrintedString
    }
}
