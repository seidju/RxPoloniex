//
//  OnboardingCoordinator.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import Foundation

class OnboardingCoordinator: BaseCoordinator, OnboardingCoorinatorOutput {
  
  var finishFlow: (() -> ())?
  
  private let factory: OnboardingModuleFactoryProtocol
  private let router: Router
  
  init(factory: OnboardingModuleFactoryProtocol, router: Router) {
    self.factory = factory
    self.router = router
  }
  
  override func start() {
    showOnboarding()
  }
  
  func showOnboarding() {
    let onboardingModule = factory.createOnboardingOutput()
    onboardingModule.onFinish = { [weak self] in
      setToSettings(key: "firstStart", value: false as AnyObject)
      self?.finishFlow?()
    }
    
    router.setRootModule(onboardingModule, hideBar: true)
  }
}
