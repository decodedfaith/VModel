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
//            // **Custom Top Tab Bar**
//                            HStack {
//                                // Left Image Icon
//                                Image("left_icon")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 24, height: 24) // Adjust size as needed
//                                
//                                Spacer()
//                                
//                                // Title in the Center
//                                Text("Feed")
//                                    .font(.headline)
//                                    .fontWeight(.bold)
//                                
//                                Spacer()
//                                
//                                // Right Image Icon
//                                Image("right_icon")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 24, height: 24) // Adjust size as needed
//                            }
//                            .padding()
            ScrollView {
                VStack {
                    ForEach(feedViewModel.posts) { post in
                        PostRow(post: post)
                    }
                }
                .padding()
            }
            .navigationTitle("Feed")
            .toolbar {
                Button(action: {
                    feedViewModel.fetchPosts()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .onAppear {
            feedViewModel.fetchPosts()
        }
    }
}
