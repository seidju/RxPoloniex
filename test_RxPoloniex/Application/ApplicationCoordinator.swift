//
//  ApplicationCoordinator.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import Foundation

fileprivate enum LaunchInstructor {
  case main, onboarding
  
  static func configure(tutorialWasShown: Bool = false) -> LaunchInstructor {
    switch tutorialWasShown {
    case false: return .onboarding
    case true: return .main
    }
  }
}

final class ApplicationCoordinator: BaseCoordinator {
  
  private let coordinatorFactory: CoordinatorFactory
  private let router: Router
  
  private var instructor: LaunchInstructor {
    return LaunchInstructor.configure(tutorialWasShown: !SharedSettings.shared.firstStart)
  }
  
  init(router: Router, coordinatorFactory: CoordinatorFactory) {
    self.router = router
    self.coordinatorFactory = coordinatorFactory
  }
  
  override func start(with option: DeepLinkOption?) {
    //start with deepLink
    if let option = option {
      switch option {
      case .onboarding: runOnboardingFlow()
      case .main: runMainFlow()
      }
      // default start
    } else {
      switch instructor {
      case .onboarding: runOnboardingFlow()
      case .main: runMainFlow()
      }
    }
  }
  
  private func runOnboardingFlow() {
    var coordinator = coordinatorFactory.makeOnboardingCoordinator(router: router)
    coordinator.finishFlow = { [weak self] in
      self?.start(with: DeepLinkOption.main)
      self?.removeDependency(coordinator)
    }
    coordinator.start()
  }
  
  private func runMainFlow() {
    let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator(router: router)
    addDependency(coordinator)
    router.setRootModule(module, hideBar: true)
    coordinator.start()
  }
  
  
}
