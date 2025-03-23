//
//  AboutView.swift
//  SocialThread
//
//  Created by Alec Smith on 3/23/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            // BACKGROUND
            LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            // PLACEHOLDER INFORMATION
            /*
            VStack {
                // PROFILE HEADER
                HStack {
                    Text(user.name)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    // SHOWS PROFILE IMAGE
                    PhotosPicker(selection: $photoPickerItem, matching: .images) {
                        
                        ZStack {
                            // USE USER PROFILE IMAGE IF NOT NIL. OTHERWISE, USE DEFAULT IMAGE
                            if let avatarImage = user.avatarImage {
                                Image(uiImage: avatarImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                
                            }
                            else {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .padding(16)
                                    .background(Color.red)
                                    .foregroundStyle(.black)
                            }
                        }
                        .frame(width:67, height: 67)
                        .clipShape(Circle())
                        
                        
                    }
                    
                }
                .padding(.horizontal)
                .foregroundStyle(.white)
                .onChange(of: photoPickerItem) {
                    // SETS NEW PHOTO SELECTED AS PROFILE IMAGE
                    Task {
                        if let pickedImage = photoPickerItem {
                            do {
                                if let data = try await pickedImage.loadTransferable(type: Data.self) {
                                    if let image = UIImage(data: data) {
                                        user.avatarImage = image
                                    }
                                }
                            }
                            catch {
                                print("Error thrown: \(error)")
                            }
                            
                        }
                        
                        photoPickerItem = nil
                    }
                }
            }
             */
        }
            
    }
}

#Preview {
    AboutView()
}
