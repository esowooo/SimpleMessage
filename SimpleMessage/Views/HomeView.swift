//
//  HomeView.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @State private var viewModel = HomeViewModel()

    
    var body: some View {
        NavigationStack{
            List{
                ForEach(rooms) { room in
                    NavigationLink{
                        RoomView(roomId: room.id, currentUser: sessionManager.currentUser!)
                    } label: {
                        Text(room.title)
                            .primaryTextStyle()
                            .foregroundStyle(.black)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Rooms"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showAddRoomView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showAlert = true
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showAddRoomView, content: {
                AddRoomView(currentUser: sessionManager.currentUser!)
            })
            .alert("Sign Out?", isPresented: $viewModel.showAlert) {
                Button("OK", role: .destructive) {
                    //MARK: - Signout (Prototype)
                    sessionManager.sessionState = .loggedOut
                }
                Button("Cancel", role: .cancel) {
                    
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(SessionManager())
}
