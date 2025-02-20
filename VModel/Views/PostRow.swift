//
//  PostRow.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

struct PostRow: View {
    var post: Post
    
    
    var body: some View {
        let firstWord = post.userName.components(separatedBy: " ").first ?? ""
        
        VStack(alignment: .leading) {
            HStack{
                Image(post.image.first ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text(post.userName)
                .font(.headline)}
            .padding(18)
            ImageCarouselView(images: post.image)
            
            
            HStack{
                HStack {
                    Button(action: {}) {
                        Image("love")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                    }
                    Button(action: {}) {
                        Image( "icon3")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                    }
                }
                Spacer()
                HStack {
                    Button(action: {}) {
                        Image("icon1")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                    }
                    Button(action: {}) {
                        Image("icon2")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    
                }
            }.padding(2)
                .padding(.horizontal, 18)
            HStack {
                (Text(firstWord)
                    .font(.footnote)
                    .bold()
                 + Text(" " + post.content)
                    .font(.footnote)
                )
                .padding(18)
            }
            
        }
        //        .padding()
        //        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
