//
//  PrimaryTextStyle.swift
//  SimpleMessage
//
//  Created by Sean Choi on 12/24/25.
//

import Foundation
import SwiftUI


struct PrimaryTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .semibold))
    }
}

extension View {
    func primaryTextStyle() -> some View {
        self.modifier(PrimaryTextStyle())
    }
}


struct SecondaryTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .regular))
    }
}

extension View {
    func secondaryTextStyle() -> some View {
        self.modifier(SecondaryTextStyle())
    }
}

