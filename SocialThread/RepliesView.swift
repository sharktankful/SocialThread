//
//  commentView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/25/25.
//

import SwiftUI
import PhotosUI

struct RepliesView: View {
    @EnvironmentObject private var profileModel: ProfileModel
    
    @Binding var post: Post
    @State var heartTap: Bool = false
    @State var message: String = ""
    
    @State var isFullScreen: Bool = false
    
    
    var body: some View {
        ZStack {
            // BACKGROUND
            LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack {
                        VStack(alignment: .leading, spacing: 10) {
                            // POST USERNAME/IMAGE
                            HStack(alignment: .top, spacing: 10) {
                                ProfileImageView(padding: 10, frame: 40)
                                
                                Text(profileModel.user.name)
                                
                                Spacer()
                            }
                            
                            
                            VStack(alignment: .leading) {
                                // SHOWS POST MESSAGE
                                Text(post.message ?? "")
                                
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
                                
                            }
                            
                            
                            // POST OPTION BAR
                            OptionBarView(post: $post)
                            
                            // COMMENT SECTION
                            Text("Replies")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.top, 15)
                        }
                        .foregroundColor(.white)
                        
                        ReplyListView(post: $post)
                        
                        Spacer()
                        
                    }
                    
                }
                
                
                // ENTER/CREATE NEW POST
                TextField("Enter Post", text: $message)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(RoundedRectangle(cornerRadius:20).opacity(0.3))
                    .foregroundStyle(.white)
                    .onSubmit {
                        // CREATES POST WITH JUST MESSAGE IF NO IMAGE
                        let reply = Reply(message: message)
                        post.replies.append(reply)
                        // ADDS REPLY TO USERS REPLY LIST
                        profileModel.user.replies.append(reply)
                        
                        // CLEARS CURRENT MESSAGE
                        message = ""
                    }
            }
            .padding()
            
        }
        .fullScreenCover(isPresented: $isFullScreen) {
            ImageView(image: post.image, isFullScreen: $isFullScreen)
        }
    }
}

#Preview {
    RepliesView(post: .constant(Post(id: UUID(), message: "Hello Comments")))
        .environmentObject(ProfileModel())
}
