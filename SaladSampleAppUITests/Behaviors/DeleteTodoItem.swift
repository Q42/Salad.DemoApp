//
//  DeleteTodoItem.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import Salad
import XCTest

struct DeleteTodoItem: Behavior {
    private let index: Int

    init(atIndex index: Int) {
        self.index = index
    }

    func perform(from view: TodoListView) -> TodoListView {
        view.todoItems[index].swipeToShowDeleteButton()
        view.root.buttons["Delete"].tap()
        return view
    }
}
