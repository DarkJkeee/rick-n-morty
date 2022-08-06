//
//  ApplicationCoordinator.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 18.06.2022.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
  private let window: UIWindow?
  private var childCoordinators = [Coordinator]()

  init(window: UIWindow?) {
    self.window = window
  }

  func start() {
    guard let window = window else { return }
    let storage = AppStorage()
    let tabBarController = UITabBarController()
    window.rootViewController = tabBarController
    window.makeKeyAndVisible()

    let tabCoordinator = TabBarCoordinator(
      tabBarController: tabBarController,
      storage: storage
    )
    tabCoordinator.start()
    childCoordinators.append(tabCoordinator)
  }
}
