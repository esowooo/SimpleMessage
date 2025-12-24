//
//  AddRoomView.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import SwiftUI

struct AddRoomView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = AddRoomViewModel()
    
    let currentUser: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .primaryTextStyle()
            TextField("Title", text: $viewModel.roomName)
                .textFieldStyle(AuthTextFieldStyle())
            Button {
                //MARK: - Add Room (Prototype)
                if viewModel.addRoom(userId: currentUser.id){
                    dismiss()
                }
            } label: {
                Text("Submit")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, 20)
            .padding(.bottom, 15)
        }
        .padding(.horizontal, 15)
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            
        } message: {
            Text(viewModel.alertMessage)
        }
        
    }
}

#Preview {
    AddRoomView(currentUser: users[0])
}
