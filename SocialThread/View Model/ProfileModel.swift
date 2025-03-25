//
//  UserModel.swift
//  SocialThread
//
//  Created by Alec Smith on 3/23/25.
//

import Foundation
import SwiftUI
import PhotosUI

class ProfileModel: ObservableObject {
    @Published var user: User = User(name: "Alec Smith", Description: "Trying my best to live life the way god wnats me to live it. Not perfect but I'm getting there (I'm trying haha..")
    @Published var photoPickerItem: PhotosPickerItem?
    
    @Published var message: String = ""
    @Published var postImagePicker: PhotosPickerItem?
    @Published var postImage: UIImage?
    
    
    // UPDATES USER PHOTO
    func userPhotoChange() {
        Task {
            if let pickedImage = photoPickerItem {
                do {
                    if let data = try await pickedImage.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.user.avatarImage = image
                            }
                        }
                    }
                }
                catch {
                    print("Error thrown: \(error)")
                }
                
            }
            DispatchQueue.main.async {
                self.photoPickerItem = nil
            }
        }
    }
    
    // CREATES POST
    func postCreation() {
        // INCLUDES PHOTO IN POST CREATION
        if let postImage = postImage {
            let post = Post(message: message, image: postImage)
            user.posts.append(post)
        }
        // CREATES POST WITH JUST MESSAGE IF NO IMAGE
        else {
            let post = Post(message: message)
            user.posts.append(post)
        }
        
        // CLEARS CURRENT MESSAGE AND PHOTO PICKED
        message = ""
        postImage = nil
    }
    
    // UPLOADS IMAGE TO POST
    func imageUpload() {
        Task {
            // INCLUDES PHOTO IN POST CREATION
            if let selectedPhoto = postImagePicker {
                do {
                    if let data = try await selectedPhoto.loadTransferable(type: Data.self) {
                        DispatchQueue.main.async {
                            self.postImage = UIImage(data: data)
                        }
                        
                    }
                }
                catch {
                    print("Error thrown: \(error)")
                }
            }
            
            // SETS SELECTED PHOTO BACK TO NIL
            DispatchQueue.main.async {
                self.postImagePicker = nil
            }
            
        }
    }
    
}
