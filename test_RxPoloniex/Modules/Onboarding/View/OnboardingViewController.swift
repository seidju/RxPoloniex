//
//  OnboardingPageViewController.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//
import UIKit
class OnboardingViewController: UIViewController, OnboardingView {
  var finishOnboarding:(() -> ())?
  
  @IBAction func finish(_ sender: Any) {
    finishOnboarding?()
  }
  
}
