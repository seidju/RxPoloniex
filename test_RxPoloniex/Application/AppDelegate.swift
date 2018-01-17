//
//  AppDelegate.swift
//  test_RxPoloniex
//
//  Created by Pavel Shatalov on 17.01.2018.
//  Copyright © 2018 Pavel Shatalov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  var rootViewController: UINavigationController!
  private var applicationCoordinator: Coordinator!
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    rootViewController = UINavigationController()
    window?.rootViewController = rootViewController
    applicationCoordinator = ApplicationCoordinator(router: RouterImp(rootController: rootViewController),coordinatorFactory: CoordinatorFactory())
    applicationCoordinator.start()
    window?.makeKeyAndVisible()

    return true
  }
}

