//
//  ContentView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import SwiftUI

struct ContentView: View {
    // CURRENT USER
    @State private var user: User = User(name: "Alec Smith")
    
    @State private var message: String = ""
    
    var body: some View {
        ZStack {
            // BACKGROUND
            LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                // SHOWS LISTS OF POSTS
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // ACTUAL POST LIST
                        ForEach(user.posts) { post in
                            
                            NewPostView(name: user.name, message: post.message ?? "")
                
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
    ContentView()
}
