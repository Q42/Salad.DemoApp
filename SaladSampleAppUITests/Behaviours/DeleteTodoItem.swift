//
//  DeleteTodoItem.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import XCTest
import Salad

struct DeleteTodoItem: Behaviour {
  private let index: Int

  init(atIndex index: Int) {
    self.index = index
  }

  func perform(from view: TodoListView) -> TodoListView {
    view.todoItems[index].swipeToDelete()
    return view
  }
}
