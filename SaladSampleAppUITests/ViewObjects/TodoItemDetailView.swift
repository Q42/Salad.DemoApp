//
//  TodoItemDetailView.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import Salad
import XCTest

struct TodoItemDetailView: ViewObject {
    let root: XCUIElement
    let identifyingElementId = "TodoDetailView"

    var titleLabel: XCUIElement { root.staticTexts["titleLabel"] }
    var timestampLabel: XCUIElement { root.staticTexts["timestampLabel"] }
}
