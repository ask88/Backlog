//
//  GameModel.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/21/21.
//

import Foundation
import Firebase

struct GameModel {
    var id: String
    var title: String
    var subtitle: String
    var likes: CGFloat
    var dislikes: CGFloat
    
    init(
        id: String,
        title: String,
        subtitle: String,
        likes: CGFloat,
        dislikes: CGFloat) {
        
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.likes = likes
        self.dislikes = dislikes
    }
}
