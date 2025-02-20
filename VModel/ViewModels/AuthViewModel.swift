//
//  AuthViewModel.swift
//  VModel
//
//  Created by user on 2/18/25.
//

//import SwiftUI
//
//class AuthViewModel: ObservableObject {
//    @Published var isAuthenticated = false
//
//    func login(email: String, password: String) {
//        if email == "test.com" && password == "password" {
//            isAuthenticated = true
//        }
//    }
//}

// AuthViewModel.swift
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var errorMessage: String?
    
    func login(username: String, password: String) {
        print("Hello, SwiftUI!")
        print(username)
        print(password)


        AuthService.shared.login(username: username, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let token):
                    print("Login successful! Token:", token)
                    UserDefaults.standard.set(token, forKey: "authToken")
                    self.isAuthenticated = true
                case .failure(let error):
                    print("Login failed with error:", error)
                    self.errorMessage = error.localizedDescription
                }
            }
            
            print(result)
        }
    }
}
