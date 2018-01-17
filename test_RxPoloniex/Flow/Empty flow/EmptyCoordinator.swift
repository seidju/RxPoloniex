//
//  EmptyCoordinator.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import Foundation

final class EmptyCoordinator: BaseCoordinator, EmptyCoordinatorOutput {
  
  var finishFlow: (() -> ())?
  private let router: Router
  private let moduleFabric: EmptyModuleFactoryProtocol
  
  init(router: Router, moduleFabric: EmptyModuleFactoryProtocol) {
    self.router = router
    self.moduleFabric = moduleFabric
  }
  
  override func start() {
    showEmptyFlow()
  }
  
  private func showEmptyFlow() {
    let emptyVc = moduleFabric.createQuotationsListOutput()
    router.setRootModule(emptyVc)
  }
  
}
