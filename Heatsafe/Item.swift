//
//  Item.swift
//  Heatsafe
//
//  Created by Kittiapakorn Seenak on 9/2/2568 BE.
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
