//
//  Querry.swift
//  VModel
//
//  Created by user on 2/20/25.
//

// GraphQLQueries.swift
struct GraphQLQueries {
    static let loginQuery = """
    mutation Login($username: String!, $password: String!) {
        tokenAuth(username: $username, password: $password) {
            success
            token
            user {
                id
                username
                email
            }
            errors
        }
    }
    """
    
    static let fetchPostsQuery = """
        query AllPosts {
            allPosts {
                id
                caption
                media {
                    itemLink
                }
                user {
                    username
                    email
                    profileRing
                    profilePictureUrl
                    thumbnailUrl
                }
            }
        }
        """
}
