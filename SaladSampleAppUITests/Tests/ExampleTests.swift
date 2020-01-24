//
//  ExampleTests.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import XCTest
import Salad

class ExampleTests: XCTestCase {

  private var scenario: Scenario<MasterView>!
  private var valuePicker: DeterministicValuePicker!

  override func setUp() {
    super.setUp()

    valuePicker = try! DeterministicValuePicker(testName: name, seed: .generate)

    let app = XCUIApplication()
    app.launchArguments = [
      // This flag is built into the application in order to reset its database for testing.
      "--Reset",
    ]
    app.launch()

    scenario = Scenario(given: app)
  }

  func testCreateItem() {
    let todoItem = valuePicker.pickValue(from: TodoItem.validItems)

    scenario
      .when(CreateItem(title: todoItem.title))
      .then { view in
        XCTAssertEqual(view.cells.count, 1)
        XCTAssertEqual(view.cells.first?.titleLabel.label, todoItem.title)
      }
  }

  func testCreateEmptyItem() {
    scenario
      .when(CreateItem(title: TodoItem.emptyItem.title))
      .then { view in
        // Oh no, this test is failing!
        // See if you can fix it.
        XCTAssertEqual(view.cells.count, 0)
      }
  }

  func testDeleteItem() {
    let todoItem = valuePicker.pickValue(from: TodoItem.validItems)

    scenario
      .when(CreateItem(title: todoItem.title))
      .when(DeleteItem(atIndex: 0))
      .then { view in
        XCTAssertEqual(view.cells.count, 0)
      }
  }

  func testDetailView() {
    let todoItem = valuePicker.pickValue(from: TodoItem.validItems)

    scenario
      .when(CreateItem(title: todoItem.title))
      .when(OpenItem(atIndex: 0))
      .then { view in
        XCTAssertEqual(view.titleLabel.label, todoItem.title)
      }
  }
}
