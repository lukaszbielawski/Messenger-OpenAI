//
//  Item.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 20/09/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
