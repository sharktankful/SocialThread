//
//  ImageView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/28/25.
//

import SwiftUI

struct ImageView: View {
    var image: UIImage?
    @Binding var isFullScreen: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            // CLOSES FULLSCREEN IMAGE
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Button("Close") {
                        isFullScreen = false
                    }
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            // IMAGE SHOWN
            if let postImage = image {
                Image(uiImage: postImage)
                    .resizable()
                    .scaledToFit()
            }
             
        }
        
    }
}

#Preview {
    ImageView(image: UIImage(), isFullScreen: .constant(true))
}
