//
//  DetailViewController.swift
//  SaladSampleApp
//
//  Created by Mathijs Bernson on 24/01/2020.
//  Copyright © 2020 Q42. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var detailDescriptionLabel: UILabel!

  func configureView() {
    // Update the user interface for the detail item.
    if let detail = detailItem {
      if let label = detailDescriptionLabel {
        self.title = detail.title
        label.text = detail.title
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    configureView()
    view.accessibilityIdentifier = "detailView"
    detailDescriptionLabel.accessibilityIdentifier = "titleLabel"
  }

  var detailItem: Todo? {
    didSet {
      // Update the view.
      configureView()
    }
  }

}
