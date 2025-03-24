//
//  ContentView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    @EnvironmentObject private var profileModel: ProfileModel
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
                    Text(profileModel.user.name)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    // SHOWS PROFILE IMAGE
                    PhotosPicker(selection: $profileModel.photoPickerItem, matching: .images) {
                        
                        ProfileImageView(padding: 16, frame: 67)
                        
                    }
                    
                }
                .padding(.horizontal)
                .foregroundStyle(.white)
                .onChange(of: profileModel.photoPickerItem) {
                    // SETS NEW PHOTO SELECTED AS PROFILE IMAGE
                    profileModel.userPhotoChange()
                }
                
                
                // SHOWS LISTS OF POSTS
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // ACTUAL POST LIST
                        ForEach(profileModel.user.posts) { post in
                            PostView(post: post)
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
                
                NewPostView(isCoverPresented: $isCoverPresented)
                
            }
        }
        
    }
}

#Preview {
    HomeView()
        .environmentObject(ProfileModel())
}
