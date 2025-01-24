//
//  AddItemView.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import Salad
import XCTest

struct AddItemView: ViewObject {
    // The alert view does not have an accessibility ID, so we hack around this for now.
    let identifyingElementId = "TodoListView"
    let root: XCUIElement

    private var textField: XCUIElement { root.textFields.firstMatch }
    private var saveButton: XCUIElement { root.buttons["Save"] }

    func enterTitle(title: String) {
        textField.typeText(title)
    }

    func tapSaveButton() {
        saveButton.tap()
    }

    func assertIdentifyingElementExists(
        timeout: TimeOut, file: StaticString = #file, line: UInt = #line
    ) {
        XCTAssertTrue(root.exists)
    }
}
