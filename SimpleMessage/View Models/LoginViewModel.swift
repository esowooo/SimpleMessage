//
//  LoginViewModel.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import Foundation


@Observable
class LoginViewModel {
    
    var email: String = "abc@test.com"
    var password: String = "abc123"
    var showPassword: Bool = false
    
    var presentRegisterView: Bool = false
    
    //error handling
    var alertTitle: String = ""
    var alertMessage: String = ""
    var showAlert: Bool = false
    
    func authentication() -> User? {
        //MARK: - Validation (Prototype)
        if email.isEmpty || password.isEmpty {
            createAlert(title: "Error", message: "Please fill in all fields.")
            return nil
        }
        //MARK: - Login (Prototype)
        for user in users {
            if user.email == email {
                if user.password == password {
                    return user
                } else {
                    createAlert(title: "Invalid Password", message: "Please check password again.")
                    return nil
                }
            } else {
                createAlert(title: "Invalid Email", message: "Please check email again.")
                return nil
            }
        }
        return nil
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
