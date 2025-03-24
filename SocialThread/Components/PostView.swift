//
//  NewPostView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import SwiftUI

struct PostView: View {
    @EnvironmentObject private var profileModel: ProfileModel
    
    @State var post: Post
    @State var heartTap: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.5)
            HStack (spacing: 15) {
                // PERSON ICON
                VStack {
                    ProfileImageView(padding: 10, frame: 40)
                    
                        Spacer()
                }
                    
                
                
                // PERSON NAME/POST MESSAGE/IMAGE
                VStack(alignment: .leading, spacing: 8) {
                    Text(profileModel.user.name)
                        .bold()
                    Text(post.message ?? "")
                    
                    // IMAGE IS INCLUDED IN POST
                    // (NOT NIL)
                    if let postImage = post.image {
                        Image(uiImage: postImage)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .frame(maxHeight: 300)
                    }
                    
                    // POST STATS
                    HStack {
                        // LIKES
                        HStack {
                            Image(systemName: heartTap == false ? "heart" : "heart.fill")
                                .foregroundStyle(heartTap == false ? .white : .red)
                                .onTapGesture {
                                    heartTap.toggle()
        
                                    if heartTap == true {
                                        post.likes += 1
                                    }
                                    else {
                                        post.likes -= 1
                                    }
                                }
                            Text(String(post.likes))
                        }
                       
                    }
                    .padding(.top, 10)
                    
                    
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            
        }
    }
}

#Preview {
    PostView(post: Post(id: UUID(), message: "Testing", image: nil, likes: 0))
        .environmentObject(ProfileModel())
}
