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
        let message = "This is a test message"
        let image = UIImage()
        let post = Post(message: message, image: image)
        
        // 2. ACT - What are the variables going to do?
        user.posts.append(post)
        
        // 3. ASSERT - What does the end result need to be?
        XCTAssertEqual(user.posts.count, 1) // Checks if post was added
        XCTAssertEqual(user.posts.first?.message, message) // Checks Message was added
        XCTAssertEqual(user.posts.first?.image, image) // Checks image was added
        XCTAssertEqual(user.posts.first?.likes, 0) // Checks like count is 0
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

}
