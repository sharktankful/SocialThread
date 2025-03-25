//
//  AboutView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/23/25.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @EnvironmentObject private var profileModel: ProfileModel
    @State private var selectedView: Int = 0

    var body: some View {
        ZStack {
            // BACKGROUND
            LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // PROFILE HEADER
                HStack {
                    Text(profileModel.user.name)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    // SHOWS PROFILE IMAGE
                    PhotosPicker(selection: $profileModel.photoPickerItem, matching: .images) {
                        
                        ProfileImageView(padding: 16, frame: 67)
                        
                    }
                    
                }
                .foregroundStyle(.white)
                .onChange(of: profileModel.photoPickerItem) {
                    // SETS NEW PHOTO SELECTED AS PROFILE IMAGE
                    profileModel.userPhotoChange()
                }
                
                // USER PROFILE DESCRIPTION
                Text(profileModel.user.Description ?? "")
                    .foregroundStyle(.white)
                
                // EDIT BUTTON
                Button {
                    // causes fullscreen to appear...
                } label: {
                    Text("Edit profile")
                        .padding(.horizontal, 70)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                VStack(spacing: 20) {
                    //PICKER TO DECIDE THE VIEW TO SHOW
                    Picker("Content related to user", selection: $selectedView) {
                        Text("Posts")
                            .tag(0)
                        Text("Replies")
                            .tag(1)
                    }
                    .pickerStyle(.segmented)
                    
                    if selectedView == 0 {
                        PostListView()
                    }
                    else {
                        ReplyListView()
                    }
                }
                .padding(.top, 15)
                

                
                Spacer()
            }
            .padding()
        }
            
            
    }
}

#Preview {
    ProfileView()
        .environmentObject(ProfileModel())
}
