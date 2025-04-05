//
//  NewPostView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/21/25.
//

import SwiftUI
import PhotosUI

struct NewPostView: View {
    @EnvironmentObject private var profileModel: ProfileModel
    @Binding var isCoverPresented: Bool
    
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
                    ProfileImageView(padding: 10, frame: 40)
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text(profileModel.user.name)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        // ENTER/CREATE NEW POST
                        //(HARD CODE FRAME HEIGHT TO MATCH TEXTFIELD HEIGHT)
                        ZStack(alignment: .leading) {
                            if profileModel.message.isEmpty {
                                Text("Enter New Post...")
                                    .foregroundStyle(.gray)
                                    .frame(height: 22)
                            }
                            
                            TextField("", text: $profileModel.message)
                                .foregroundStyle(.white)
                                .onSubmit {
                                    profileModel.postCreation()
                                    
                                    // ONCE SUBMITTED, APP WILL GO BACK TO HOME VIEW
                                    isCoverPresented = false
                                }
                            
                        }
                        
                        if let selectedPhoto = profileModel.postImage {
                            // IMAGE POST PREVIEW
                            ZStack(alignment: .topTrailing) {
                                Image(uiImage: selectedPhoto)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 7))
                                    .frame(maxHeight: 200)
                                
                                // REMOVES IMAGE SELECTED FOR POST
                                Button {
                                    withAnimation(.easeOut(duration: 0.3)) {
                                        profileModel.postImage = nil
                                    }
                                   
                                } label: {
                                    Text("X")
                                        .padding(10)
                                        .background(Color.black.opacity(0.5))
                                        .foregroundStyle(.white)
                                        .clipShape(Circle())
                                        .padding(5)
                                }
                            }
                            
                        }
                         
                        // SELECT/UPLOAD PHOTO FOR POST
                        PhotosPicker(selection: $profileModel.postImagePicker) {
                            // ICON TO EVENTUALLY UPLOAD THE IMAGE
                            Image(systemName: "photo.badge.plus")
                                .font(.system(size: 25))
                                .foregroundStyle(.gray)
                                .padding(.top, 7)
                        }
                        .onChange(of: profileModel.postImagePicker) {
                            profileModel.imageUpload()
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
    NewPostView(isCoverPresented: .constant(true))
        .environmentObject(ProfileModel())
}
