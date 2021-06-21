//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Andrea Chagas on 20/6/21.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
    }
}
