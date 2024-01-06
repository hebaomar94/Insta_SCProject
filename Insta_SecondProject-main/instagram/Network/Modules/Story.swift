//
//  Story.swift
//  instagram
//
//  Created by Heba Omar94 on 14/12/2023.
//

import Foundation
import IBAnimatable

struct Story {
    
    let imageUrl: String?
    let username: String?
    let isMyStory: Bool
    
    init(imageUrl: String?,
         username: String? = nil,
         isMyStory: Bool = false) {
        self.imageUrl = imageUrl
        self.username = username
        self.isMyStory = isMyStory
    }
}
