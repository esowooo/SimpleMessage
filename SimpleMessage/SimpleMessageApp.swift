//
//  SimpleMessageApp.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import SwiftUI

@main
struct SimpleMessageApp: App {
    
    @State var sessionManager = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            switch sessionManager.sessionState {
            case .loggedIn:
                HomeView()
                    .environment(sessionManager)
            case .loggedOut:
                LoginView()
                    .environment(sessionManager)
            }
        }
    }
}
