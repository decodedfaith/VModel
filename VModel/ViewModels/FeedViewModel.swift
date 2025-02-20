//
//  FeedViewModel.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

class FeedViewModel: ObservableObject {
//    @Published var posts: [Post] = []
    @Published var posts: [GraphQLPost] = []
        @Published var isLoading = false
        @Published var errorMessage: String?

//    func fetchPosts() {
//        posts = [
//            Post(userName: "Jennifer Lewis",
//                                  content: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward #Fashio... Read more...",
//                 image:["2", "2", "2", "2", "2", "2"],
//                 location: ""
//                ),
//            Post(userName: "Samantha Joan", content: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward #Fashio... Read more...",
//                 image:["3", "3", "3", "3", "3", "3"],
//                 location: "Manchester Gallery, Manchester UK"
//                ),
//            Post(userName: "Matthew Jonas",
//                 content: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward #Fashio... Read more...",
//                 image:["4", "4", "4", "4", "4", "4"],
//                 location: "Manchester Gallery, Manchester UK"
//                ),
//            Post(userName: "Olivier Meyers",
//                 content: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward #Fashio... Read more...",
//                 image:["1", "1", "1", "1", "1", "1"],
//                 location: "Manchester Gallery, Manchester UK"
//                )
//        ]
//    }
    
    func fetchPosts() {
        print("Hello, 00000000!")
            
            isLoading = true
            errorMessage = nil

            AuthService.shared.fetchAllPosts() { [weak self] result in
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    self.isLoading = false
                    
                    switch result {
                    case .success(let posts):
                        self.posts = posts
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        print("Hello, 88888888!")
        
//        print(posts[0].media[0].itemLink + "222222222222222")
        }
}
