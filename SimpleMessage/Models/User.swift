//
//  User.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import Foundation


struct User {
    let id: String
    let email: String
    let username: String
    let password: String
}


//MARK: - Mock Data
var users: [User] = [
    User(id: "abc1", email: "abc@test.com", username: "abc", password: "abc123"),
    User(id: "def1", email: "def@test.com", username: "def", password: "abc123"),
    User(id: "ghi1", email: "ghi@test.com", username: "ghi", password: "abc123")
]
