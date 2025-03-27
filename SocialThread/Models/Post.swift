//
//  Note.swift
//  SocialThread
//
//  Created by Alec Smith on 3/19/25.
//

import Foundation
import UIKit

struct Post: Identifiable {
    var id: UUID = UUID()
    var message: String?
    var image: UIImage? = nil
    var likes: Int = 0
    var replies: [Reply] = []
}

struct Reply: Identifiable {
    var id: UUID = UUID()
    var message: String?
    var image: UIImage? = nil
    var likes: Int = 0
}
