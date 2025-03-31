//
//  PostOptionView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/25/25.
//

import SwiftUI

struct OptionBarView: View {
    @Binding var post: Post
    
    var body: some View {
        // POST OPTION BAR
        HStack(spacing: 30) {
            // LIKES
            HStack(spacing: 3) {
                Image(systemName: post.heartTap == false ? "heart" : "heart.fill")
                    .foregroundStyle(post.heartTap == false ? .gray : .red)
                    .onTapGesture {
                        post.heartTap.toggle()

                        if post.heartTap == true {
                            post.likes += 1
                        }
                        else {
                            post.likes -= 1
                        }
                    }
                Text(String(post.likes))
                    
            }
            
            // MESSAGES
            HStack(spacing: 3) {
                HStack {
                    Image(systemName: "message")
                    
                    Text(String(post.replies.count))
                }
                    
            }
        }
        .foregroundStyle(.gray)
    }
}

#Preview {
    OptionBarView(post: .constant(Post()))
}
