//
//  APIError.swift
//  VModel
//
//  Created by user on 2/20/25.
//

// APIError.swift
import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case requestFailed(String)
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .requestFailed(let message):
            return message
        case .decodingError:
            return "Failed to decode the response."
        }
    }
}
