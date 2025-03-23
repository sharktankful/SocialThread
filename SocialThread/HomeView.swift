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
    
    @State private var photoPickerItem: PhotosPickerItem?
    @State private var isCoverPresented: Bool = false
    
    var body: some View {
        
        ZStack {
            // BACKGROUND
            LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            // LIST OF ALL POSTS
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
                                    .foregroundStyle(.black)
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
                            
                            PostView(name: user.name, profileImage: user.avatarImage, message: post.message ?? "", postImage: post.image ?? nil, likes: post.likes)
                
                        }
                    }
                }
                
                Spacer()
                
                
                
            }
            .padding()
            
            
            // BUTTON TO BRING UP POST CREATION SHEET
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        isCoverPresented = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 50))
                            .bold()
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color.deepPurple)
                            .clipShape(Circle())
                    }
                }
            }
            .padding(.horizontal)
            .fullScreenCover(isPresented: $isCoverPresented) {
                
                NewPostView(isCoverPresented: $isCoverPresented, user: $user, profileImage: user.avatarImage)
                
            }
        }
        
    }
}

#Preview {
    HomeView()
}
