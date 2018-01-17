//
//  OnboardingPageViewController.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//
import UIKit
class OnboardingViewController: UIViewController, OnboardingView {
  var onFinish: (() -> Void)?
  
  private var finishButton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    commonInit()
    title = "Onboarding"
  }
  
  private func commonInit() {
    let welcomeLabel = UILabel()
    welcomeLabel.text = "This is simple demonstration of using Coordinators pattern along with RxSwift"
    welcomeLabel.numberOfLines = 0
    welcomeLabel.textAlignment = .center
    welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(welcomeLabel)
    
    view.backgroundColor = .white
    finishButton = UIButton(frame: CGRect.zero)
    finishButton.setTitle("Finish onboarding", for: .normal)
    finishButton.setTitleColor(SharedSettings.shared.themeColor, for: .normal)
    finishButton.tintColor = SharedSettings.shared.themeColor
    finishButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(finishButton)
    NSLayoutConstraint.activate([
      welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
      welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
      welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      finishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      finishButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16.0),
      finishButton.heightAnchor.constraint(equalToConstant: 50.0),
      finishButton.widthAnchor.constraint(equalToConstant: 200.0)
    ])
    finishButton.addTarget(self, action: #selector(self.finish(sender:)), for: .touchUpInside)
  }
  
  
 @objc private func finish(sender: UIButton) {
    onFinish?()
  }
  
}
