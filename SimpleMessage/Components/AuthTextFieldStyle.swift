//
//  AuthTextFieldStyle.swift
//  CookBook
//
//  Created by Sean Choi on 12/20/25.
//

import Foundation
import SwiftUI

struct AuthTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack (spacing: 7) {
            configuration
                .font(.system(size: 14))
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .frame(height: 17)
            Divider()
                .background(.black)
                .padding(.bottom, 15)
        }
    }
}

