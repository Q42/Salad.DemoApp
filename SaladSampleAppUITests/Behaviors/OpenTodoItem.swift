//
//  OpenTodoItem.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import Salad
import XCTest

struct OpenTodoItem: Behavior {
    private let index: Int

    init(atIndex index: Int) {
        self.index = index
    }

    func perform(from view: TodoListView) -> TodoItemDetailView {
        return view.todoItems[index].open()
    }
}
