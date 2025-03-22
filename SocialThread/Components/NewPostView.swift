//
//  NewPostView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/21/25.
//

import SwiftUI

struct NewPostView: View {
    @Binding var isCoverPresented: Bool
    @Binding var user: User
    
    @State var message: String = ""
    
    var profileImage: UIImage?
    
    
    var body: some View {
        ZStack {
            
            // BACKGROUND
            LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                HStack(alignment: .top) {
                    // RETURN TO HOMEVIEW
                    Button {
                        isCoverPresented.toggle()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    // PAGE TITLE
                    Text("New Post")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Spacer()
                    Spacer()
                }
                
                
                // POST CREATION FIELD
                HStack(alignment: .top, spacing: 10) {
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
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        // ENTER/CREATE NEW POST
                        //(HARD CODE FRAME HEIGHT TO MATCH TEXTFIELD HEIGHT)
                        ZStack(alignment: .leading) {
                            if message.isEmpty {
                                Text("Enter New Post...")
                                    .foregroundStyle(.gray)
                                    .frame(height: 22)
                            }
                            
                            
                            TextField("", text: $message)
                                .foregroundStyle(.white)
                                .onSubmit {
                                    let post = Post(message: message)
                                    user.posts.append(post)
                                    message = ""
                                    
                                    //ONCE SUBMITTED, APP WILL GO BACK TO HOME VIEW
                                    isCoverPresented = false
                                }
                            
                        }
                        
                        VStack {
                            // ICON TO EVENTUALLY UPLOAD THE IMAGE
                            Image(systemName: "photo.badge.plus")
                                .font(.system(size: 25))
                                .foregroundStyle(.gray)
                                .padding(.top, 7)
                        }
                    }
                    
                    
                    Spacer()
                }
                
                
               
                
                
                Spacer()
                
            }
            .padding()
            
            
            
            
        }
       

    }
}

#Preview {
    NewPostView(isCoverPresented: .constant(true), user: .constant(User(name: "Alec Smith")))
}
