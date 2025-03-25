//
//  PostListView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/24/25.
//

import SwiftUI

struct PostListView: View {
    @EnvironmentObject private var profileModel: ProfileModel

    var body: some View {
        // SHOWS LISTS OF POSTS
        ScrollView {
            VStack(spacing: 20) {
                
                // ACTUAL POST LIST
                ForEach(profileModel.user.posts) { post in
                    PostView(post: post)
                }
            }
        }
    }
}

#Preview {
    PostListView()
        .environmentObject(ProfileModel())
}
