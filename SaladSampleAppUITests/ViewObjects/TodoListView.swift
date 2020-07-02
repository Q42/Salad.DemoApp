//
//  TodoListView.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import XCTest
import Salad

struct TodoListView: ViewObject {
  let root: XCUIElement
  let identifyingElementId = "masterView"

  private var addButton: XCUIElement { element("addButton") }

  var todoItems: [TodoItemCell] {
    return root.cells.allElementsBoundByIndex.map(TodoItemCell.init)
  }

  func tapAddButton() -> AddItemView {
    addButton.tap()
    return root.createVerifiedViewObject()
  }
}
