//
//  UserCreationTests.swift
//  SocialThreadTests
//
//  Created by Alec Smith on 4/5/25.
//

import XCTest
@testable import SocialThread

final class UserCreationTests: XCTestCase {

    func testSuccesfulUserCreation() {
        // 1. ARRANGE - Setup variables
        let name = "Test User"
        let description = "This is a test user"
        
        // 2. ACT - What are the variables going to do?
        let user = User(name: name, description: description)
        
        // 3. ASSERT - What does the end result need to be?
        XCTAssertEqual(user.name, name) // Equals the name
        XCTAssertEqual(user.description, description) // Equals the description
        
    }

}
