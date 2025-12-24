//
//  AddRoomViewModel.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import Foundation

@Observable
class AddRoomViewModel {
    
    var roomName: String = ""
    
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
    
    func validate() -> Bool {
        if roomName.isEmpty {
            createAlert(title: "Error", message: "Please enter a room name.")
            return false
        }
        if roomName.count < 5 {
            createAlert(title: "Invalid Room Name", message: "Room name must be 5 characters or more.")
            return false
        }
        return true
    }
    
    
    func addRoom(userId: String) -> Bool {
        if validate() {
            let users = [userId]
            let messages: [Message] = []
            let newRoom = Room(id: UUID().uuidString, users: users, title: roomName, messages: messages, createdAt: Date(), updatedAt: Date())
            rooms.append(newRoom)
            return true
        }
        print("unable to add room")
        return false
    }
    
}
