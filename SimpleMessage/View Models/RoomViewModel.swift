//
//  RoomViewModel.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import Foundation

@Observable
class RoomViewModel {
    
    var room: Room = Room(
        id: "room1",
        users: ["abc1", "def1", "ghi1"],
        title: "Room1",
        messages: [
            Message(
                id: "mes1",
                roomId: "room1",
                ownerId: "abc1",
                content: "This is room1",
                timestamp: Date()
            )
        ],
        createdAt: Date(),
        updatedAt: Date())
    
    
    var messages: [Message] = []
    var newMessage: String = ""

    //MARK: - Store Message (Prototype)
    func saveMessage(roomId: String, ownerId: String){
        let newMessage = Message(id: UUID().uuidString, roomId: roomId, ownerId: ownerId, content: newMessage, timestamp: Date())
        if let index = rooms.firstIndex(where: { $0.id == roomId }) {
            rooms[index].messages.append(newMessage)
        }
        self.newMessage = ""
    }
    
    //MARK: - Get Room (Prototype) -> Must be removed with Firestore
    func getRoom(roomId: String) -> Room? {
        guard let room = rooms.first(where: { $0.id == roomId }) else {
            return nil
        }
        return room
    }
    
}
