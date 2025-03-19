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
    var image: UIImage?
    var likes: Int = 0
    var dislikes: Int = 0
}
