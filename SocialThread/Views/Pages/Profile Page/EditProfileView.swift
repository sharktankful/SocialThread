//
//  EditProfileView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/27/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @EnvironmentObject var profileModel: ProfileModel
    @Binding var isFullScreenVisible: Bool
    
    
    
    var body: some View {
        let descriptionBinding = Binding(
            get: { profileModel.user.description ?? "" },
            set: { profileModel.user.description = $0 })
        
        ZStack {
            LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            VStack(alignment: .center, spacing: 20) {
                // PAGE HEADER
                HStack(alignment: .top) {
                    Button("Cancel") {
                        isFullScreenVisible = false
                    }
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Button("Done") {
                        isFullScreenVisible = false
                    }
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                }
                .padding(.bottom, 20)
                
                // USER ICON
                PhotosPicker(selection: $profileModel.photoPickerItem) {
                    ProfileImageView(padding: 25, frame: 100)
                }
                
                // PROFILE INFORMATION
                VStack(spacing: 20) {
                    // NAME FIELD
                    EditInfoView(text: $profileModel.user.name, heading: "Name", placeHolder: "Enter Name", isTextEditor: false)
                    
                    // BIO FIELD
                    EditInfoView(text: descriptionBinding, heading: "Bio", isTextEditor: true)
                }
                .font(.system(size: 18))
                
                
                Spacer()
                
                
                
            }
            .padding()
            
            
            
        }
        
       
    }
}

#Preview {
    EditProfileView(isFullScreenVisible: .constant(true))
        .environmentObject(ProfileModel())
}
