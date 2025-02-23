//
//  SignUpView.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var userName = ""
    @State private var userType = ""
    @State private var label = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isBusinessAccount = false
    @StateObject var authViewModel = AuthViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Last Name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.horizontal)
            
            TextField("Username", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.horizontal)
            TextField("UserType", text: $userType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Label", text: $label)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.horizontal)
            Toggle("Is Business Account", isOn: $isBusinessAccount)
                .padding(.horizontal)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            
            NavigationLink(destination: FeedView(), isActive: $authViewModel.isAuthenticated) {
                EmptyView() // Ensures navigation happens when isAuthenticated becomes true
            }

            Button(action: {
                authViewModel.signUp(
                    email: email,
                    username: userName,
                    firstName: firstName,
                    lastName: lastName,
                    userType: userType,
                    label: label,
                    isBusinessAccount: isBusinessAccount,
                    password1: password,
                    password2: confirmPassword
                )
                print("Attempting sign up...")
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .padding(.top, 10)


            
            HStack {
                Text("Already have an account?")
                NavigationLink("Log in", destination: LoginView())
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
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
