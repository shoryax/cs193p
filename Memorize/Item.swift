//
//  Item.swift
//  Memorize
//
//  Created by Shorya Vardhan on 5/15/25.
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
