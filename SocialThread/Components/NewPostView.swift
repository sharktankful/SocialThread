//
//  NewPostView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import SwiftUI

struct NewPostView: View {
    var name: String
    var message: String
    var profileImage: UIImage?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.5)
            HStack (spacing: 15) {
                // PERSON ICON
                VStack {
                    
                    ZStack {
                        // USE USER PROFILE IMAGE IF NOT NIL. OTHERWISE, USE DEFAULT IMAGE
                        if let avatarImage = profileImage {
                            Image(uiImage: avatarImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        }
                        else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(10)
                                .background(Color.red)
                        }
                    }
                    .frame(width:40, height: 40)
                    .clipShape(Circle())
                    
                        Spacer()
                }
                    
                
                
                // PERSON NAME/POST MESSAGE
                VStack(alignment: .leading, spacing: 5) {
                    Text(name)
                        .bold()
                    Text(message)
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            
        }
    }
}

#Preview {
    NewPostView(name: "Alec", message: "This is my post here! I'm really excited to see how this post will turn out!! :)", profileImage: nil)
}
