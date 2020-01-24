//
//  MasterView.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import XCTest
import Salad

struct MasterView: ViewObject {
  let root: XCUIElement
  let identifyingElementId = "masterView"

  private var addButton: XCUIElement { element("addButton") }

  var cells: [ItemCell] {
    return root.cells.allElementsBoundByIndex.map(ItemCell.init)
  }

  func tapAddButton() -> AddItemView {
    addButton.tap()
    return root.createVerifiedViewObject()
  }
}
