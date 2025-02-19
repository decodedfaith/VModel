//
//  AuthViewModel.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false

    func login(email: String, password: String) {
        if email == "test.com" && password == "password" {
            isAuthenticated = true
        }
    }
}


//
//import SwiftUI
//import Combine
//
//class AuthViewModel: ObservableObject {
//    @Published var isLoggedIn = false
//
//    func login(email: String, password: String) {
//        if email == "test@example.com" && password == "password" {
//            isLoggedIn = true
//        }
//    }
//}
