//
//  TabBarView.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import UIKit

protocol TabBarView: class {
  var onQuotationsFlowSelect: ((UINavigationController) -> ())? { get set }
  var onEmptyFlowSelect: ((UINavigationController) -> ())? { get set }
  var onViewWillAppear: ((UINavigationController) -> ())? { get set }

}

