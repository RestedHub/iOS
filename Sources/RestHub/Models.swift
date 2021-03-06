//
//  File.swift
//  
//
//  Created by Kenneth Dubroff on 3/5/21.
//

import Foundation

public struct User: Codable {
    
    let username: String
    let id: Int
    let nodeId: String
    let avatarUrl: URL?
    let gravatarId: String
    let url: URL
    let htmlUrl: URL
    let followersUrl: URL
    let followingUrl: String
    let gistsUrl: String
    let starredUrl: String
    let subscriptionsUrl: URL
    let organizationsUrl: URL
    let reposUrl: URL
    let eventsUrl: String
    let receivedEventsUrl: URL
    let type: String
    let siteAdmin: Bool
    let name: String
    let company: String
    let blog: URL
    let location: String
    let email: String?
    let hireable: Bool?
    let bio: String
    let twitterUsername: String?
    let numPublicRepos: Int
    let numPublicGists: Int
    let numFollowers: Int
    let numFollowing: Int
    let createdAt: Date
    let updatedAt: Date
    
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
        //          "created_at": "2017-04-26T05:12:36Z",
        //          "updated_at": "2021-03-02T05:15:51Z"
        case createdAt
        case updatedAt
    }

}
        

