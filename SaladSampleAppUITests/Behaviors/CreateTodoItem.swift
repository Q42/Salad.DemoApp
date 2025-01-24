//
//  CreateTodoItem.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import Salad
import XCTest

struct CreateTodoItem: Behavior {
    let title: String

    func perform(from view: TodoListView) -> TodoListView {
        let addItemView = view.tapAddButton()
        addItemView.enterTitle(title: title)
        addItemView.tapSaveButton()

        return view
    }
}
