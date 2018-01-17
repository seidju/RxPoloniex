//
//  TabBarViewController.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController,TabBarView, UITabBarControllerDelegate {

  var onEmptyFlowSelect: ((UINavigationController) -> ())?
  var onQuotationsFlowSelect: ((UINavigationController) -> ())?
  var onViewWillAppear: ((UINavigationController) -> ())?
 
  private var quotationsController: UINavigationController!
  private var emptyController: UINavigationController!

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
    commonInit()

  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    view.tintColor = SharedSettings.shared.themeColor
    quotationsController = UINavigationController()
    emptyController = UINavigationController()
    quotationsController.tabBarItem = UITabBarItem(title: "Quotations", image: #imageLiteral(resourceName: "quotations"), selectedImage: #imageLiteral(resourceName: "quotations_selected"))
    emptyController.tabBarItem = UITabBarItem(title: "Empty", image: #imageLiteral(resourceName: "empty"), selectedImage: #imageLiteral(resourceName: "empty_selected"))
    setViewControllers([quotationsController, emptyController], animated: false) 
    tabBar.barTintColor = UIColor.hexColor(rgb: 0xF8F8F8)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let controller = customizableViewControllers?.first as? UINavigationController {
      onViewWillAppear?(controller)
    }
  }
  

  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
    if selectedIndex == 0 {
      onQuotationsFlowSelect?(controller)
    } else if selectedIndex == 1 {
      onEmptyFlowSelect?(controller)
    }
  }
}

