//
//  CreateTodoItem.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import XCTest
import Salad

struct CreateTodoItem: Behaviour {
  let title: String

  func perform(from view: MasterView) -> MasterView {
    let addItemView = view.tapAddButton()
    addItemView.enterTitle(title: title)
    addItemView.tapSaveButton()

    return view
  }
}
