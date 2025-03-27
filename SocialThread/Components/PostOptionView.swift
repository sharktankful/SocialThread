//
//  PostOptionView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/25/25.
//

import SwiftUI

struct PostOptionView: View {
    @Binding var post: Post
    
    var body: some View {
        // POST OPTION BAR
        HStack {
            // LIKES
            HStack {
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
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    PostOptionView(post: .constant(Post()))
}
