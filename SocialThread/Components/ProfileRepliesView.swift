//
//  UserRepliesView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/27/25.
//

import SwiftUI

struct ProfileRepliesView: View {
    @EnvironmentObject private var profileModel: ProfileModel

    var body: some View {
        // SHOWS LISTS OF REPLIES
        ScrollView {
            VStack(spacing: 20) {
                ForEach(profileModel.user.replies) { reply in
                    ReplyView(reply: reply)
                }
            }
        }
    }
}

#Preview {
    ProfileRepliesView()
        .environmentObject(ProfileModel())
}
