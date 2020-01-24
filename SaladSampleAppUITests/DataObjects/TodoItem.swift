//
//  TodoItem.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import Foundation

struct TodoItem {
  let title: String

  static let validItems: [TodoItem] = [
    TodoItem(title: "Get milk 🥛"),
    TodoItem(title: "Wash clothes 👕"),
    TodoItem(title: "Take shower"),
  ]

  static let emptyItem = TodoItem(title: "")
}
