//
//  DetailView.swift
//  SaladSampleAppUITests
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import XCTest
import Salad

struct DetailView: ViewObject {
  let root: XCUIElement
  let identifyingElementId = "detailView"

  var titleLabel: XCUIElement { element("titleLabel") }
}
