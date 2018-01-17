//
//  CoordinatorFactoryProtocol.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryProotocol {
  
  func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoorinatorOutput 
  func makeTabbarCoordinator(router: Router) -> (configurator: Coordinator, toPresent: Presentable?)
  func makeQuotationsCoordinator(router: Router, factory: QuotationsModuleFactoryProtocol) -> Coordinator & QuotationsCoordinatorOutput 

  func makeEmptyCoordinator(router: Router, factory: EmptyModuleFactoryProtocol) -> Coordinator & EmptyCoordinatorOutput
}
