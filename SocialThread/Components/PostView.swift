//
//  NewPostView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import SwiftUI

struct PostView: View {
    var name: String
    var profileImage: UIImage?
    var message: String
    var postImage: UIImage?
    
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
                                .foregroundStyle(.black)
                        }
                    }
                    .frame(width:40, height: 40)
                    .clipShape(Circle())
                    
                        Spacer()
                }
                    
                
                
                // PERSON NAME/POST MESSAGE/IMAGE
                VStack(alignment: .leading, spacing: 8) {
                    Text(name)
                        .bold()
                    Text(message)
                    
                    // IMAGE IS INCLUDED IN POST
                    // (NOT NIL)
                    if let postImage = postImage {
                        Image(uiImage: postImage)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .frame(maxHeight: 300)
                    }
                    
                    
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            
        }
    }
}

#Preview {
    PostView(name: "Alec", profileImage: nil, message: "This is my post here! I'm really excited to see how this post will turn out!! :)")
}
