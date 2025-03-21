//
//  ContentView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    // CURRENT USER
    @State private var user: User = User(name: "Alec Smith")
    
    @State private var message: String = ""
    @State private var photoPickerItem: PhotosPickerItem?
    
    var body: some View {
        
        ZStack {
            // BACKGROUND
            LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            
            VStack {
                
                // PROFILE HEADER
                HStack {
                    Text(user.name)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    // SHOWS PROFILE IMAGE
                    PhotosPicker(selection: $photoPickerItem, matching: .images) {
                        
                        ZStack {
                            // USE USER PROFILE IMAGE IF NOT NIL. OTHERWISE, USE DEFAULT IMAGE
                            if let avatarImage = user.avatarImage {
                                Image(uiImage: avatarImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                
                            }
                            else {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .padding(16)
                                    .background(Color.red)
                            }
                        }
                        .frame(width:67, height: 67)
                        .clipShape(Circle())
                        
                        
                    }
                    
                }
                .padding(.horizontal)
                .foregroundStyle(.white)
                .onChange(of: photoPickerItem) {
                    // SETS NEW PHOTO SELECTED AS PROFILE IMAGE
                    Task {
                        if let pickedImage = photoPickerItem {
                            do {
                                if let data = try await pickedImage.loadTransferable(type: Data.self) {
                                    if let image = UIImage(data: data) {
                                        user.avatarImage = image
                                    }
                                }
                            }
                            catch {
                                print("Error thrown: \(error)")
                            }
                            
                        }
                        
                        photoPickerItem = nil
                    }
                }
                
                
                // SHOWS LISTS OF POSTS
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // ACTUAL POST LIST
                        ForEach(user.posts) { post in
                            
                            NewPostView(name: user.name, message: post.message ?? "", profileImage: user.avatarImage)
                
                        }
                    }
                }
                
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
                    }
                
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
