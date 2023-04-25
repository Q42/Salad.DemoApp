//
//  ExampleTests.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import XCTest
import Salad

class TodoAppTests: XCTestCase {

  private var scenario: Scenario<TodoListView>!
  private var valuePicker: DeterministicValuePicker!

  override func setUpWithError() throws {
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    valuePicker = try DeterministicValuePicker(testName: name, seed: .generate)

    let app = XCUIApplication()
    app.launchArguments = [
      // This flag is built into the application in order to reset its database for testing.
      "--Reset"
    ]
    app.launch()

    scenario = Scenario(given: app)
  }

  /// GIVEN: An empty to-do list
  /// WHEN: I create a to-do item titled <title>
  /// THEN: I expect a single to-do item on my to-do list, and its title equals <title>
  func testCreateTodoItem() {
    let todoItem = valuePicker.pickValue(from: TodoItem.validItems)

    scenario
      .then { view in XCTAssertEqual(view.todoItems.count, 0) }
      .when(CreateTodoItem(title: todoItem.title))
      .then { view in
        XCTAssertEqual(view.todoItems.count, 1)
        XCTAssertEqual(view.todoItems.first?.titleLabel.label, todoItem.title)
      }
  }

  /// GIVEN: An empty to-do list
  /// WHEN: I create a to-do item with a title of empty string
  /// THEN: I expect to see an empty to-do list
  func testCreateEmptyTodoItem() {
    scenario
      .then { view in XCTAssertEqual(view.todoItems.count, 0) }
      .when(CreateTodoItem(title: ""))
      .then { view in XCTAssertEqual(view.todoItems.count, 0) }
  }

  /// GIVEN: A to-do list with a single to-do item on it
  /// WHEN: I swipe to delete the to-do item
  /// THEN: I expect to see an empty to-do list
  func testDeleteTodoItem() throws {
    throw XCTSkip("This test is currently broken, after the swipe to delete, the count of todos never goes back to 0")

    let todoItem = valuePicker.pickValue(from: TodoItem.validItems)

    scenario
      .then { view in XCTAssertEqual(view.todoItems.count, 0) }
      .when(CreateTodoItem(title: todoItem.title))
      .then { view in XCTAssertEqual(view.todoItems.count, 1) }
      .when(DeleteTodoItem(atIndex: 0))
      .then { view in XCTAssertEqual(view.todoItems.count, 0) }
  }

  /// GIVEN: A to-do list with a single item on it
  /// WHEN: I tap on the item
  /// THEN: I expect to see the detailed info about the to-do item
  func testDetailView() {
    let todoItem = valuePicker.pickValue(from: TodoItem.validItems)

    scenario
      .when(CreateTodoItem(title: todoItem.title))
      .when(OpenTodoItem(atIndex: 0))
      .then { view in
        XCTAssertEqual(view.titleLabel.label, todoItem.title)
      }
  }
}
