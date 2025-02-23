//
//  LoginView.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @StateObject var authViewModel = AuthViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Log in")
                .font(.custom("Avenir Next", size: 18))
                .fontWeight(.bold )
            
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 12) // Keep padding similar to RoundedBorderTextFieldStyle
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(red: 0.313, green: 0.235, blue: 0.231).opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 12)
            }
            
            VStack(spacing: 8) {
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $password).autocapitalization(.none)
                    } else {
                        SecureField("Password", text: $password).autocapitalization(.none)
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 12)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 12)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(red: 0.313, green: 0.235, blue: 0.231).opacity(0.2))
                    .padding(.horizontal, 12)
            }
            Text("Forgot Password?")
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
            
            NavigationLink(destination: FeedView(), isActive: $authViewModel.isAuthenticated) {
                EmptyView() // This ensures the navigation happens when isAuthenticated becomes true
            }

            Button(action: {
                authViewModel.login(username: email, password: password)
                print("Attempting login...")
            }) {
                Text("Log in")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(15)
            Text("or")
                .font(.caption)
                .foregroundColor(Color(red: 0.313, green: 0.235, blue: 0.231).opacity(0.5)) // Ensures text remains white
                .padding(8)
            VStack(spacing: 16) {
                
                SocialLoginButton(imageName: "facebook", text: "Continue with Facebook")
                SocialLoginButton(imageName: "google", text: "Continue with Google")
                SocialLoginButton(imageName: "apple", text: "Continue with Apple")
                
            }
            .padding()
            
            HStack {
                Text("Don't have an account?").font(.caption)
                    .foregroundColor(Color(red: 0.313, green: 0.235, blue: 0.231).opacity(0.5))
                NavigationLink("Join", destination: SignUpView())
                    .foregroundColor(.blue)
                    .font(.caption)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
        .navigationBarBackButtonHidden(true) // Hides default back button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss()
                }) {
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)                            .font(.caption)
                            .padding(.horizontal, 12)
                        Spacer()
                    }}
            }
        }
    }
}






struct SocialLoginButton: View {
    var imageName: String
    var text: String
    
    var body: some View {
        Button(action: {
            print("\(text) tapped")
        }) {
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                
                Spacer()
                
                Text(text)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                
                Spacer()
                
            }
            .frame(height: 35)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1)
            )
            .cornerRadius(8)
        }
    }
}
