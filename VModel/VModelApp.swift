//
//  VModelApp.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

@main
struct VModelApp: App {
    @StateObject var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            if authViewModel.isAuthenticated {
                FeedView()
            } else {
                WelcomeView()
            }
        }
    }
}
