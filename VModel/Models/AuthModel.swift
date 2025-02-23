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
struct SignupRequest: Codable {
    let query: String
    let variables: [String: AnyCodable]
}


struct SignupResponse: Codable {
    let data: SignupData?
}

struct SignupData: Codable {
    let register: RegisterResponse
}

struct RegisterResponse: Codable {
    let success: Bool
    let token: String?
    let id: String?
    let pk: String?
    let restToken: String?
    let errors: [String: [GraphQLError]]?
}

struct GraphQLError: Codable {
    let message: String
    let code: String
}

//
///// A generic Codable wrapper to handle Any type encoding and decoding
//struct AnyCodable: Codable {
//    let value: Any
//
//    init(_ value: Any) {
//        self.value = value
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//
//        if let value = try? container.decode(String.self) {
//            self.value = value
//        } else if let value = try? container.decode(Int.self) {
//            self.value = value
//        } else if let value = try? container.decode(Double.self) {
//            self.value = value
//        } else if let value = try? container.decode(Bool.self) {
//            self.value = value
//        } else if let value = try? container.decode([AnyCodable].self) {
//            self.value = value
//        } else if let value = try? container.decode([String: AnyCodable].self) {
//            self.value = value
//        } else {
//            throw DecodingError.dataCorruptedError(
//                in: container,
//                debugDescription: "Unsupported type"
//            )
//        }
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//
//        if let value = value as? String {
//            try container.encode(value)
//        } else if let value = value as? Int {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? [AnyCodable] {
//            try container.encode(value)
//        } else if let value = value as? [String: AnyCodable] {
//            try container.encode(value)
//        } else {
//            let context = EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Unsupported type")
//            throw EncodingError.invalidValue(value, context)
//        }
//    }
//}

struct AnyCodable: Codable {
    let value: Any
    
    init(_ value: Any) {
        self.value = value
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if let value = value as? String {
            try container.encode(value)
        } else if let value = value as? Int {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? [AnyCodable] {
            try container.encode(value)
        } else if let value = value as? [String: AnyCodable] {
            try container.encode(value)
        } else {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Value cannot be encoded"))
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let value = try? container.decode(String.self) {
            self.value = value
        } else if let value = try? container.decode(Int.self) {
            self.value = value
        } else if let value = try? container.decode(Double.self) {
            self.value = value
        } else if let value = try? container.decode(Bool.self) {
            self.value = value
        } else if let value = try? container.decode([AnyCodable].self) {
            self.value = value
        } else if let value = try? container.decode([String: AnyCodable].self) {
            self.value = value
        } else {
            throw DecodingError.typeMismatch(AnyCodable.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Type not supported"))
        }
    }
}
