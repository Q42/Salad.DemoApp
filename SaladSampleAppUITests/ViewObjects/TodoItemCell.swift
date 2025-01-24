//
//  ItemCell.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import Salad
import XCTest

struct TodoItemCell: ViewObject {
    /// The root of this cell
    let root: XCUIElement
    let identifyingElementId = "TodoItemCell"

    var titleLabel: XCUIElement { root.staticTexts.firstMatch }

    var dateLabel: XCUIElement { root.staticTexts.allElementsBoundByIndex[1] }

    func swipeToShowDeleteButton() {
        root.swipeLeft(velocity: .slow)
    }

    func open() -> TodoItemDetailView {
        root.tap()
        // Our `root` is scoped to the TableViewCell of this item.
        // Hence we need to take a DetailView from the application root.
        return XCUIApplication().createVerifiedViewObject()
    }
}
