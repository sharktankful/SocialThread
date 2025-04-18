//
//  NewPostView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import SwiftUI

struct PostView: View {
    @EnvironmentObject private var profileModel: ProfileModel
    
    @Binding var post: Post
    
    @State var isFullScreen: Bool = false
    
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
                    
                    // DRILLS INTO REPLIES VIEW
                    NavigationLink {
                        RepliesView(post: $post)
                    } label: {
                        HStack {
                            Text(post.message ?? "")
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        
                    }

                   
                    
                    // IMAGE IS INCLUDED IN POST
                    // (NOT NIL)
                    if let postImage = post.image {
                        Image(uiImage: postImage)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .frame(maxHeight: 300)
                            .onTapGesture {
                                isFullScreen = true
                            }
                    }
                    
                    // POST STATS
                    OptionBarView(post: $post)
                    .padding(.top, 10)
                    
                    
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            
        }
        .fullScreenCover(isPresented: $isFullScreen) {
            ImageView(image: post.image, isFullScreen: $isFullScreen)
        }
        
    }
}

#Preview {
    PostView(post: .constant(Post(id: UUID(), message: "Doing a test to see how it goes", image: nil, likes: 0)))
        .environmentObject(ProfileModel())
}
