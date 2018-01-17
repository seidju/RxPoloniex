//
//  TabBarCoordinator.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import Foundation

import UIKit

class TabbarCoordinator: BaseCoordinator {
  
  private let  tabbarView: TabBarView
  private let coordinatorFactory: CoordinatorFactory
  private let router: Router
  //MARK: - Services
  
  private var emptyRouter: Router?
  private var quotationsRouter: Router?
  let moduleFactory = ModuleFactory()
  
  init(tabbarView: TabBarView, router: Router, coordinatorFactory: CoordinatorFactory) {
    self.tabbarView = tabbarView
    self.coordinatorFactory = coordinatorFactory
    self.router = router
   
  }
  
  override func start() {
    tabbarView.onViewWillAppear = runQuotationsFlow()
    tabbarView.onQuotationsFlowSelect = runQuotationsFlow()
    tabbarView.onEmptyFlowSelect = runEmptyFlow()
  }
  
  //MARK: - Flow
  private func runQuotationsFlow() -> ((UINavigationController) -> ()) {
    return { navController in
      if navController.viewControllers.isEmpty == true {
        self.quotationsRouter = RouterImp(rootController: navController)
        let quotationsCoordinator = self.coordinatorFactory.makeQuotationsCoordinator(router: self.quotationsRouter!, factory: self.moduleFactory)
        quotationsCoordinator.start()
        self.addDependency(quotationsCoordinator)
      }
    }
  }
  
  private func runEmptyFlow() -> ((UINavigationController) -> ()) {
    return { navController in
      if navController.viewControllers.isEmpty == true {
        self.emptyRouter = RouterImp(rootController: navController)
        let emptyCoordinator = self.coordinatorFactory.makeEmptyCoordinator(router: self.emptyRouter!, factory: self.moduleFactory)
        emptyCoordinator.start()
        self.addDependency(emptyCoordinator)
      }
    }
  }
}
