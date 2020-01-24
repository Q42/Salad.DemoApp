//
//  ItemCell.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import XCTest
import Salad

struct ItemCell: ViewObject {
  let root: XCUIElement
  let identifyingElementId = "itemCell"

  var titleLabel: XCUIElement {
    root.staticTexts.firstMatch
  }

  var dateLabel: XCUIElement {
    root.staticTexts.allElementsBoundByIndex[1]
  }

  func swipeToDelete() {
    root.swipeLeft()
    root.buttons["Delete"].tap()
  }

  func open() -> DetailView {
    root.tap()
    // Our `root` is scoped to the TableViewCell of this item.
    // Hence we need to take a DetailView from the application root.
    return XCUIApplication().createVerifiedViewObject()
  }
}
