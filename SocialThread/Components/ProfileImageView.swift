//
//  ProfileImageView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/23/25.
//

import SwiftUI

struct ProfileImageView: View {
    @EnvironmentObject private var profileModel: ProfileModel
    
    var padding: CGFloat
    var frame: CGFloat

    var body: some View {
        ZStack {
            // USE USER PROFILE IMAGE IF NOT NIL. OTHERWISE, USE DEFAULT IMAGE
            if let avatarImage = profileModel.user.avatarImage {
                Image(uiImage: avatarImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            }
            else {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(padding)
                    .background(Color.red)
                    .foregroundStyle(.black)
            }
        }
        .frame(width:frame, height: frame)
        .clipShape(Circle())
    }
}

#Preview {
    ProfileImageView(padding: 16, frame: 67)
        .environmentObject(ProfileModel())
}
