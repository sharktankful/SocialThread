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
                    Text("Social App 😉")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    Spacer()
                }
                
                
                // SHOWS LISTS OF POSTS
                ScrollView {
                    PostListView()
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
                .padding(.bottom, 30)
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
