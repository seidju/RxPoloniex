//
//  EmptyViewController.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController, EmptyView {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Empty"
    view.backgroundColor = SharedSettings.shared.themeColor

  }
}
