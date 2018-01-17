//
//  QuotationsCoordinator.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import Foundation

final class QuotationsCoordinator: BaseCoordinator, QuotationsCoordinatorOutput {
  
  var finishFlow: (() -> ())?
  private let router: Router
  private let moduleFabric: QuotationsModuleFactoryProtocol
  
  init(router: Router, moduleFabric: QuotationsModuleFactoryProtocol) {
    self.router = router
    self.moduleFabric = moduleFabric
  }
  
  override func start() {
    showQuotationsList()
  }
  
  private func showQuotationsList() {
    let quotationsListVc = moduleFabric.createQuotationsListOutput()
    router.setRootModule(quotationsListVc, hideBar: false)
  }
  
}
