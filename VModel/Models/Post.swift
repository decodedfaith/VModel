//
//  Post.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let userName: String
    let content: String
    let image: String
    let location: String
}
