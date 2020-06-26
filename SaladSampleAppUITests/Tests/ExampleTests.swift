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
      "--Reset"
    ]
    app.launch()

    scenario = Scenario(given: app)
  }

  func testCreateTodoItem() {
    let todoItem = valuePicker.pickValue(from: TodoItem.validItems)

    scenario
      .then { view in XCTAssertEqual(view.cells.count, 0) }
      .when(CreateTodoItem(title: todoItem.title))
      .then { view in
        XCTAssertEqual(view.cells.count, 1)
        XCTAssertEqual(view.cells.first?.titleLabel.label, todoItem.title)
      }
  }

  func testCreateEmptyTodoItem() {
    scenario
      .when(CreateTodoItem(title: TodoItem.emptyItem.title))
      .then { view in XCTAssertEqual(view.cells.count, 0) }
  }

  func testDeleteTodoItem() {
    let todoItem = valuePicker.pickValue(from: TodoItem.validItems)

    scenario
      .then { view in XCTAssertEqual(view.cells.count, 0) }
      .when(CreateTodoItem(title: todoItem.title))
      .then { view in XCTAssertEqual(view.cells.count, 1) }
      .when(DeleteTodoItem(atIndex: 0))
      .then { view in XCTAssertEqual(view.cells.count, 0) }
  }

  func testDetailView() {
    let todoItem = valuePicker.pickValue(from: TodoItem.validItems)

    scenario
      .when(CreateTodoItem(title: todoItem.title))
      .when(OpenTodoItem(atIndex: 0))
      .then { view in XCTAssertEqual(view.titleLabel.label, todoItem.title) }
  }
}
