//
//  PostOptionView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/25/25.
//

import SwiftUI

struct PostOptionView: View {
    @State var post: Post
    @State var heartTap: Bool = false
    
    var body: some View {
        // POST OPTION BAR
        HStack {
            // LIKES
            HStack {
                Image(systemName: heartTap == false ? "heart" : "heart.fill")
                    .foregroundStyle(heartTap == false ? .gray : .red)
                    .onTapGesture {
                        heartTap.toggle()

                        if heartTap == true {
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
    PostOptionView(post: Post())
}
