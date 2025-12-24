//
//  RoomView.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import SwiftUI

struct RoomView: View {
    
    var roomId: String
    let currentUser: User
    
    @State var viewModel = RoomViewModel()

    var body: some View {
        VStack {
            ScrollView {
                Text(viewModel.getRoom(roomId: roomId)!.title)
                    .font(.title)
                LazyVStack {
                    ForEach(viewModel.getRoom(roomId: roomId)!.messages) { message in
                        if message.ownerId == currentUser.id {
                            HStack {
                                Spacer()
                                Text("me")
                                    .foregroundStyle(.white)
                                    .padding(9)
                                    .primaryTextStyle()
                                    .background(.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                ZStack {
                                    Text(message.content)
                                        .padding()
                                        .secondaryTextStyle()
                                        .background(.blue.opacity(0.3))
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                            }
                        } else {
                            HStack {
                                Text(message.ownerId)
                                    .foregroundStyle(.white)
                                    .padding(9)
                                    .primaryTextStyle()
                                    .background(.purple)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                ZStack {
                                    Text(message.content)
                                        .padding()
                                        .secondaryTextStyle()
                                        .background(.purple.opacity(0.3))
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.horizontal,15)
            }
            Divider()
            HStack {
                TextField("Type a message", text: $viewModel.newMessage)
                    .secondaryTextStyle()
                Spacer()
                Button("Send") {
                    //MARK: - save message (Prototype)
                    viewModel.saveMessage(roomId: roomId, ownerId: currentUser.id)
                }
                .frame(width: 80)
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding(15)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    RoomView(roomId: "room1", currentUser: users[0])
}
