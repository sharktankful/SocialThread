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
                HStack(alignment: .center) {
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
                
                HStack {
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
                    
                    
                    // ENTER/CREATE NEW POST
                    TextField("Enter Post", text: $message)
                        .textFieldStyle(.plain)
                        .padding()
                        .background(RoundedRectangle(cornerRadius:20).opacity(0.3))
                        .foregroundStyle(.white)
                        .onSubmit {
                            let post = Post(message: message)
                            user.posts.append(post)
                            message = ""
                            
                            //ONCE SUBMITTED, APP WILL GO BACK TO HOME VIEW
                            isCoverPresented = false
                        }
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
