//
//  RegisterViewModel.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import Foundation

@Observable
class RegisterViewModel {
    
    var email: String = ""
    var username: String = ""
    var password: String = ""
    var showPassword: Bool = false
    
    //error handling
    var alertTitle: String = ""
    var alertMessage: String = ""
    var showAlert: Bool = false
    
    
    //MARK: - Register (Prototype)
    func register() -> User? {
        if validate() {
            let User = User(id: UUID().uuidString, email: email, username: username, password: password)
            users.append(User)
            return User
        }
        return nil
    }
    
    //MARK: - Validation (Prototype)
    func validate() -> Bool {
        if email.isEmpty || username.isEmpty || password.isEmpty {
            createAlert(title: "Error", message: "Please fill in all fields.")
            return false
        }
        if email.count < 5 {
            createAlert(title: "Invalid Email", message: "Email must be 5 characters or more.")
            return false
        }
        if password.count < 6 {
            createAlert(title: "Invalid Password", message: "Password must be 6 characters or more.")
            return false
        }
        if username.count < 4 {
            createAlert(title: "Invalid Username", message: "Username must be 4 characters or more.")
            return false
        }
        return true
    }
    
    func createAlert(title: String, message: String, error: Error? = nil){
        if let error = error {
            print(error.localizedDescription)
        }
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}
