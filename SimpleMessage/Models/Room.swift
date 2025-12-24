//
//  Room.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import Foundation


struct Room: Identifiable {
    let id: String
    var users: [String] //userId
    var title: String
    var messages: [Message] = []//chat history - owner(userId) : message
    let createdAt: Date //for ordering
    var updatedAt: Date //for ordering
}

struct Message: Identifiable {
    let id: String //Identify individual message. need for delete.
    let roomId: String //RoomView: call message where room_id = Room.id
    let ownerId: String //sender, receiver identification
    let content: String //messager
    let timestamp: Date //order
}



//MARK: - Mock Data
var rooms : [Room] = [
    Room(id: "room1", users: ["abc1", "def1", "ghi1"], title: "Room1", messages: messages1, createdAt: Date(), updatedAt: Date()),
    Room(id: "room2", users: ["abc1", "def1"], title: "Room2", messages: messages2, createdAt: Date(), updatedAt: Date()),
    Room(id: "room3", users: ["abc1", "ghi1"], title: "Room3", messages: messages3, createdAt: Date(), updatedAt: Date())
]

var messages1: [Message] = [
    Message(id: "mes1", roomId: "room1",ownerId: "abc1", content: "This is room1", timestamp: Date()),
    Message(id: "mes2", roomId: "room1",ownerId: "def1", content: "I am user2", timestamp: Date()),
    Message(id: "mes3", roomId: "room1",ownerId: "abc1", content: "I am user1", timestamp: Date()),
    Message(id: "mes4", roomId: "room1",ownerId: "ghi1", content: "I am user3", timestamp: Date())
]

var messages2: [Message] = [
    Message(id: "mes5", roomId: "room2",ownerId: "abc1", content: "This is room2", timestamp: Date()),
    Message(id: "mes6", roomId: "room2",ownerId: "ghi1", content: "I am user3", timestamp: Date()),
    Message(id: "mes7", roomId: "room2",ownerId: "abc1", content: "I am user1", timestamp: Date())
]

var messages3: [Message] = [
    Message(id: "mes8", roomId: "room3",ownerId: "abc1", content: "This is room3", timestamp: Date()),
    Message(id: "mes9", roomId: "room3",ownerId: "def1", content: "I am user2", timestamp: Date()),
    Message(id: "mes10", roomId: "room3",ownerId: "abc1", content: "I am user1", timestamp: Date())
]

