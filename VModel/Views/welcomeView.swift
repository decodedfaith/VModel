//
//  welcomeView.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("background") // Add background image to Assets.xcassets
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("WELCOME TO VMODEL")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    Spacer()
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .frame(width:175)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .frame(width:175)
                            .padding()
                            .background(Color.brown)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("BETA")
                        .frame(width:70)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}
