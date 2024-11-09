//
//  Image+Extension.swift
//  async_Image_in_swiftUI
//
//  Created by Rakesh Yadav on 09/11/24.
//

import SwiftUICore

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .foregroundColor(.purple)
            .frame(maxWidth: 128.0)
            .opacity(0.5)
    }
}
