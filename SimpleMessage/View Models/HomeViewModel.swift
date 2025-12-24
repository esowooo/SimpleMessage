//
//  HomeViewModel.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import Foundation

@Observable
class HomeViewModel {
    
    var showAddRoomView: Bool = false
        
    //error handling
    var alertTitle: String = ""
    var alertMessage: String = ""
    var showAlert: Bool = false
    
    func createAlert(title: String, message: String, error: Error? = nil){
        if let error = error {
            print(error.localizedDescription)
        }
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}
