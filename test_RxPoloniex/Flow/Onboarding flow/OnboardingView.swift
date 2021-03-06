//
//  OnboardingView.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import Foundation
protocol OnboardingView: BaseView {
  var onFinish: (() -> Void)? { get set }
}
