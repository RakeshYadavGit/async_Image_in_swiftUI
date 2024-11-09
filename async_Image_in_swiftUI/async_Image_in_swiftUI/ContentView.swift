//
//  ContentView.swift
//  async_Image_in_swiftUI
//
//  Created by Rakesh Yadav on 09/11/24.
//

import SwiftUI

struct ContentView: View {
    private let url: String = "https://i.postimg.cc/6qfVzfQm/pexels-myersmc16-919278.jpg"
    var body: some View {
        
//         Mark 1: Basic
//        
//         AsyncImage(url: URL(string: self.url))
//        
//         Mark 2: Scale
//        
//         AsyncImage(url: URL(string: self.url), scale: 2.0)
//        
//         Mark 3: Placeholder
        
//        AsyncImage(url: URL(string: self.url)) { image in
//            image
//                .imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        }
//        .padding(40.0)
        
//        Mark 4: Phase in async image
        
//        AsyncImage(url: URL(string: self.url)) { phase in
//            // Success: Image loaded successfully
//            // Error: Image not loaded due to some issue
//            // Empty: Image not downloaded yet
//            
//            if let image = phase.image {
//                image
//                    .imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill")
//                    .iconModifier()
//            } else {
//                Image(systemName: "photo.cicle.fill")
//                    .iconModifier()
//            }
//        }
//        .padding(40.0)
        
//        Mark 5: Animation
        
        AsyncImage(url: URL(string: self.url), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image
                    .imageModifier()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill")
                    .iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill")
                    .iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40.0)
    }
}

#Preview {
    ContentView()
}
