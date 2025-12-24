//
//  SessionManager.swift
//  CookBook
//
//  Created by Sean Choi on 12/20/25.
//

import Foundation
//import FirebaseAuth
//import FirebaseCore

@Observable
class SessionManager {
    
    var sessionState: SessionState = .loggedOut
    var currentUser: User? = users[0]
    
    init() {
        //MARK: - Token for checking previous login status - stored as local storage cache (keychain)
//        if FirebaseApp.allApps == nil {
//            FirebaseApp.configure()
//        }
//        sessionState = Auth.auth().currentUser != nil ? .loggedIn : .loggedOut
    }
}
