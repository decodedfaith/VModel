//
//  FeedViewModel.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []

    func fetchPosts() {
        posts = [
            Post(userName: "Jennifer Lewis",
                                  content: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward #Fashio... Read more...",
                 image:"2",
                 location: ""
                ),
            Post(userName: "Samantha Joan", content: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward #Fashio... Read more...",
                 image:"3",
                 location: "Manchester Gallery, Manchester UK"
                ),
            Post(userName: "Matthew Jonas",
                 content: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward #Fashio... Read more...",
                 image:"4",
                 location: "Manchester Gallery, Manchester UK"
                ),
            Post(userName: "Olivier Meyers",
                 content: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward #Fashio... Read more...",
                 image:"1",
                 location: "Manchester Gallery, Manchester UK"
                )
        ]
    }
}
