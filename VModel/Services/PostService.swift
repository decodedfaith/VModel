//
//  PostService.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import Foundation

class PostService {
    static func fetchPosts() -> [Post] {
        return [
            Post(userName: "Jennifer", content: "Unleash your style with our revolutionary product.",
                 image: "",
                 location: ""),
            Post(userName: "Samantha", content: "New fashion trends are here!",
                 image: "",
                 location: ""
                ),
            Post(userName: "Matthew", content: "Check out my latest shoot!",
                 image: "",
                 location: ""
                )
        ]
    }
}
