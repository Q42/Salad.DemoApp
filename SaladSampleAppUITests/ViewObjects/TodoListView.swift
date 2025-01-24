//
//  TodoListView.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import Salad
import XCTest

struct TodoListView: ViewObject {
    let root: XCUIElement
    let identifyingElementId = "TodoListView"

    private var addButton: XCUIElement { root.buttons["addButton"] }

    var todoItems: [TodoItemCell] {
        return root.cells.allElementsBoundByIndex.map {
            TodoItemCell(root: $0)
        }
    }

    func tapAddButton() -> AddItemView {
        addButton.tap()
        return root.createVerifiedViewObject()
    }
}
