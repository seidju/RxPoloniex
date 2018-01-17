//
//  CoordinatorFactory.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import Foundation

class CoordinatorFactory: CoordinatorFactoryProotocol {
  
  
  func makeTabbarCoordinator(router: Router) -> (configurator: Coordinator, toPresent: Presentable?) {
    let tabBar = TabBarController()
    let coordinator = TabbarCoordinator(tabbarView: tabBar, router: router, coordinatorFactory: CoordinatorFactory())
    return (coordinator, tabBar)
  }
  
  func makeQuotationsCoordinator(router: Router, factory: QuotationsModuleFactoryProtocol) -> Coordinator & QuotationsCoordinatorOutput {
    let coordinator = QuotationsCoordinator(router: router, moduleFabric: factory)
    return coordinator
  }
  
  func makeEmptyCoordinator(router: Router, factory: EmptyModuleFactoryProtocol) -> Coordinator & EmptyCoordinatorOutput {
    let coordinator = EmptyCoordinator(router: router, moduleFabric: factory)
    return coordinator
  }
  
  func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoorinatorOutput {
    let coordinator = OnboardingCoordinator(factory: ModuleFactory(), router: router)
    return coordinator
  }

}
