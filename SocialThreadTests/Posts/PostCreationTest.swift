//
//  PostCreationTest.swift
//  SocialThreadTests
//
//  Created by Alec Smith on 4/5/25.
//

import XCTest
import PhotosUI
@testable import SocialThread

final class PostCreationTest: XCTestCase {
    var user = User(name: "Test User", description: "This is a test user")
    
    func testSuccessfulPostCreation() {
        // 1. ARRANGE - Setup Variables
        let profileModel = ProfileModel()
        profileModel.message = "This is a test message"
        profileModel.postImage = UIImage()
        
        
        // 2. ACT - What are the variables going to do?
        profileModel.postCreation()
        
        
        // 3. ASSERT - What does the end result need to be?
        XCTAssertEqual(profileModel.user.posts.count, 1)
        XCTAssertEqual(profileModel.user.posts.first?.message, "This is a test message")
        XCTAssertNotNil(profileModel.user.posts.first?.image)
        XCTAssertEqual(profileModel.message, "")
        XCTAssertEqual(profileModel.postImage, nil)
    }
    
    
    func testPostCreationIsNil() {
        // 1. ARRANGE
        let message: String? = nil
        let image: UIImage? = nil
        let post = Post(message: message, image: image)
        
        // 2. ACT
        user.posts.append(post)
        
        // 3. ASSERT
        let storedPost = user.posts.first
        XCTAssertNil(storedPost?.message)
        XCTAssertNil(storedPost?.image)
        
    }
    
    func testPostImageUpload() {
        let profileModel = ProfileModel()
        let sampleImage = UIImage(systemName: "photo")! // Make a UI Photo
        let imageData = sampleImage.pngData()! // Convert image to raw data
        
        profileModel.handleImageData(imageData) // Convert raw data to UIImage and set it to my posts picture
        
        XCTAssertNotNil(profileModel.postImage) // Checks if image is in post
        XCTAssertNil(profileModel.postImagePicker) // Checks if post photo picker is nil
    }

}
