//
//  AuthService.swift
//  VModel
//
//  Created by user on 2/18/25.
//

// AuthService.swift
import Foundation

class AuthService {
    static let shared = AuthService()
    private let baseURL = "https://uat-api.vmodel.app/graphql/"
    private var authToken: String?
    
    func login(username: String, password: String, completion: @escaping (Result<String, APIError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let requestBody = LoginRequest(query: GraphQLQueries.loginQuery, variables: ["username": username, "password": password])
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(requestBody)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Network error:", error.localizedDescription)
                completion(.failure(.requestFailed("")))
                return
            }

            guard let data = data, error == nil else {
                completion(.failure(.requestFailed(error?.localizedDescription ?? "Unknown error")))
                return
            }
            
            print("Raw JSON response:", String(data: data, encoding: .utf8) ?? "Invalid data")
 
            
            do {
                let decodedResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                if let token = decodedResponse.data?.tokenAuth.token {
                    // Store token in UserDefaults
                    UserDefaults.standard.set(token, forKey: "authToken")
                    completion(.success(token))
                } else {
                    completion(.failure(.requestFailed("Invalid credentials")))
                }
            } catch {
                print("Decoding error:", error)
                completion(.failure(.decodingError))
            }
        }.resume()
        getAuthToken()
    }
    
    func getAuthToken() {
        let token = UserDefaults.standard.string(forKey: "authToken")
        authToken = token
        }

    func fetchAllPosts(completion: @escaping (Result<[GraphQLPost], APIError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        print(authToken ?? "mmmmmmmmmm")

        let requestBody = GraphQLRequest(query: GraphQLQueries.fetchPostsQuery, variables: ["token": authToken ?? ""])

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(authToken ?? "")", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(requestBody)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network error:", error.localizedDescription)
                completion(.failure(.requestFailed(error.localizedDescription)))
                return
            }

            guard let data = data else {
                completion(.failure(.requestFailed("No data received")))
                return
            }
            
            print("Raw JSON response:", String(data: data, encoding: .utf8) ?? "Invalid data")

            do {
                let decodedResponse = try JSONDecoder().decode(GraphQLPostResponse.self, from: data)
                if let posts = decodedResponse.data?.allPosts {
                    completion(.success(posts))
                } else {
                    completion(.failure(.requestFailed("Failed to fetch posts")))
                }
            } catch {
                print("Decoding error:", error)
                completion(.failure(.decodingError))
            }
        }.resume()
    }

    
}
