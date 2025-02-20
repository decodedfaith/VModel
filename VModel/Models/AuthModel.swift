//
//  AuthModel.swift
//  VModel
//
//  Created by user on 2/20/25.
//

import Foundation

struct LoginRequest: Codable {
    let query: String
    let variables: [String: String]
}

struct LoginResponse: Codable {
    struct DataResponse: Codable {
        struct TokenAuth: Codable {
            let success: Bool
            let token: String?
            let user: User?
            let errors: [String: [String]]?
        }
        let tokenAuth: TokenAuth
    }
    let data: DataResponse?
}

struct User: Codable {
    let id: String
    let username: String
    let email: String
}

struct GraphQLRequest<V: Encodable>: Encodable {
    let query: String
    let variables: V
}

struct GraphQLPostResponse: Codable {
    let data: GraphQLPostData?
}

struct GraphQLPostData: Codable {
    let allPosts: [GraphQLPost]
}

struct GraphQLPost: Identifiable, Codable {
    let id: String
    let caption: String
    let media: [GraphQLMedia]
    let user: GraphQLUser
}

struct GraphQLMedia: Codable {
    let itemLink: String
}

struct GraphQLUser: Codable {
    let username: String
    let email: String
    let profileRing: String?
    let profilePictureUrl: String?
    let thumbnailUrl: String?
}
