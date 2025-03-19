//
//  NewPostView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import SwiftUI

struct NewPostView: View {
    var name: String
    var message: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.5)
            HStack (spacing: 15) {
                // PERSON ICON
                VStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:20, height: 20)
                        .padding(10)
                        .background(Circle()
                            .fill(Color.red))
                    
                        Spacer()
                }
                    
                
                
                // PERSON NAME/POST MESSAGE
                VStack(alignment: .leading, spacing: 5) {
                    Text(name)
                        .bold()
                    Text(message)
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            
        }
    }
}

#Preview {
    NewPostView(name: "Alec", message: "This is my post here! I'm really excited to see how this post will turn out!! :)")
}
