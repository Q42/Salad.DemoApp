//
//  TodoItem.swift
//  SaladSampleApp
//
//  Created by Mathijs Bernson on 24/01/2025.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
    var title: String
    var timestamp: Date

    init(title: String, timestamp: Date) {
        self.title = title
        self.timestamp = timestamp
    }
}
