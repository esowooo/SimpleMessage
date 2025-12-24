//
//  RegisterView.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var viewModel = RegisterViewModel()
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username")
                .primaryTextStyle()
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(AuthTextFieldStyle())
            Text("Email")
                .primaryTextStyle()
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(AuthTextFieldStyle())
            Text("Password")
                .primaryTextStyle()
            PasswordComponentView(showPassword: $viewModel.showPassword, password: $viewModel.password)
            Button {
                //MARK: - Validation -> Register (Prototype)
                if let user = viewModel.register() {
                    sessionManager.currentUser = user
                    sessionManager.sessionState = .loggedIn
                }
            } label: {
                Text("Submit")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, 20)
            .padding(.bottom, 15)
            HStack {
                Spacer()
                Text("Already have an account?")
                    .secondaryTextStyle()
                Button {
                    dismiss()
                } label: {
                    Text("Login")
                        .secondaryTextStyle()
                }
                Spacer()
            }
        }
        .padding(.horizontal, 15)
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            
        } message: {
            Text(viewModel.alertMessage)
        }
    }
}

#Preview {
    RegisterView()
        .environment(SessionManager())
}
