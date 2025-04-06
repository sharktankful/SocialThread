//
//  ReplyCreationTest.swift
//  SocialThreadTests
//
//  Created by Alec Smith on 4/5/25.
//

import XCTest
@testable import SocialThread
final class ReplyCreationTest: XCTestCase {
    
    func testPostReplySuccesfullCreation() {
        // 1. ARRANGE
        var user = User(name: "Test User", description: "This is a test user")
        let post = Post(message: "This is a test message")
        let reply = Reply(message: "This is a test reply")
        
        // 2. ACT
        user.posts.append(post)
        user.posts[0].replies.append(reply)
        
        // 3. ASSERT
        let storedReply = user.posts[0].replies.first
        
        XCTAssertEqual(user.posts[0].replies.count, 1) // Check Reply count is 1
        XCTAssertEqual(storedReply?.message, reply.message) // Check Message stored is same
        XCTAssertNil(storedReply?.image) // Check reply image is nil
        XCTAssertEqual(storedReply?.likes, 0) // Check Like count is 0
        
    }
    
}
