//
//  FeedView.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

struct FeedView: View {
    @StateObject var feedViewModel = FeedViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image("row")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Image("column")
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                    
                    Spacer()
                    
                    Text("Feed")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    HStack {
                        Image("video")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Image("notification")
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                }
                .padding()
                
                ScrollView {
                    VStack {
                        ForEach(feedViewModel.posts) { post in
                            PostRow(post: post)
                        }
                    }
                }
                BottomNavBar()
            }
            .onAppear {
                feedViewModel.fetchPosts()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
