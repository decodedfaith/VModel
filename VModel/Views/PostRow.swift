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
                Image(post.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                Text(post.userName)
                .font(.headline)}
            Image(post.image)
            
                Text(firstWord + "  :" + post.content)
                .font(.body)
            HStack{
                HStack {
                    Button(action: {}) {
                        Image(systemName: "heart")
                    }
                    Button(action: {}) {
                        Image(systemName: "bubble.right")
                    }
                    Button(action: {}) {
                        Image(systemName: "arrowshape.turn.up.right")
                    }
                }
                Spacer()
                HStack {
                    Button(action: {}) {
                        Image(systemName: "heart")
                    }
                    Button(action: {}) {
                        Image(systemName: "bubble.right")
                    }
                    Button(action: {}) {
                        Image(systemName: "arrowshape.turn.up.right")
                    }
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
