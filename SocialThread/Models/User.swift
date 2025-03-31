//
//  User.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import Foundation
import UIKit


struct User {
    var name: String
    var avatarImage: UIImage? = nil
    var Description: String?
    var posts: [Post] = []
    var replies: [Reply] = []
}
