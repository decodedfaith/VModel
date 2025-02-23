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
    
    static let signUpQuery = """
        mutation Register(
          $email: String!,
          $username: String!,
          $firstName: String!,
          $lastName: String!,
          $userType: String!,
          $label: String!,
          $isBusinessAccount: Boolean!,
          $password1: String!,
          $password2: String!
        ) {
          register(
            email: $email,
            username: $username,
            firstName: $firstName,
            lastName: $lastName,
            userType: $userType,
            label: $label,
            isBusinessAccount: $isBusinessAccount,
            password1: $password1,
            password2: $password2
          ) {
            success
            token
            id
            pk
            restToken
            errors
          }
        }
        """
}
