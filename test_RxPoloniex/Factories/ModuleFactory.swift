//
//  ModuleFactory.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import Foundation

class ModuleFactory:
    QuotationsModuleFactoryProtocol,
    EmptyModuleFactoryProtocol,
    OnboardingModuleFactoryProtocol {
  
  func createQuotationsListOutput() -> QuotationsView {
    let model = QuotationsListModel()
    let viewModel: QuotationsListViewModelProtocol = QuotationsListViewModel(quotationsListModel: model)
    let vc = QuotationsListViewController(viewModel: viewModel)
    return vc
  }
  
  func createQuotationsListOutput() -> EmptyView {
    let vc = EmptyViewController()
    return vc
  }
  
  func createOnboardingOutput() -> OnboardingView {
    let vc = OnboardingViewController()
    return vc
  }
}
