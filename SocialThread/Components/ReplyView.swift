//
//  ReplyView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/26/25.
//

import SwiftUI

struct ReplyView: View {
    @EnvironmentObject private var profileModel: ProfileModel
    
    @State var reply: Reply
    @State var heartTap: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.5)
            HStack (spacing: 15) {
                // PERSON ICON
                VStack {
                    ProfileImageView(padding: 10, frame: 40)
                    
                        Spacer()
                }
                    
                
                
                // PERSON NAME/POST MESSAGE/IMAGE
                VStack(alignment: .leading, spacing: 8) {
                    Text(profileModel.user.name)
                        .bold()
                    
                    Text(reply.message ?? "")
                    
                    
                    // IMAGE IS INCLUDED IN POST
                    // (NOT NIL)
                    if let postImage = reply.image {
                        Image(uiImage: postImage)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .frame(maxHeight: 300)
                    }
                    
                    
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            
        }
        
    }
}

#Preview {
    ReplyView(reply: Reply())
        .environmentObject(ProfileModel())
}
