//
//  ReplyListView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/24/25.
//

import SwiftUI

struct ReplyListView: View {
    @Binding var post: Post
    
    var body: some View {
        // SHOWS LISTS OF REPLIES
        VStack(spacing: 20) {
            // ACTUAL POST REPLIES LIST
            ForEach(post.replies) { reply in
                ReplyView(reply: reply)
            }
        }
        
    }
}

#Preview {
    ReplyListView(post: .constant(Post(id: UUID(), message: "Test Message")))
}
