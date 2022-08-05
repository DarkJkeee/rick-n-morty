//
//  TabBarCoordinator.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 18.06.2022.
//

import Foundation
import UIKit

final class TabBarCoordinator: Coordinator {
  // MARK: Screen coordinators
  private let homeCoordinator: HomeCoordinator
  private let searchCoordinator: SearchCoordinator
  private let favoritesCoordinator: FavoritesCoordinator

  private let tabBarController: UITabBarController

  // MARK: Coordinator properties
  var rootViewController: UIViewController? {
    return tabBarController
  }

  init(tabBarController: UITabBarController) {
    self.tabBarController = tabBarController

    homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    searchCoordinator = SearchCoordinator(
      navigationController: UINavigationController(),
      storage: AppStorage()
    )
    favoritesCoordinator = FavoritesCoordinator(navigationController: UINavigationController())
  }

  func start() {
    var controllers = [UIViewController]()

    homeCoordinator.start()
    searchCoordinator.start()
    favoritesCoordinator.start()

    let homeController = homeCoordinator.rootViewController
    homeController.tabBarItem = UITabBarItem(
      title: "",
      image: UIImage(named: "house"),
      selectedImage: nil
    )
    controllers.append(homeController)

    let favoritesController = favoritesCoordinator.rootViewController
    favoritesController.tabBarItem = UITabBarItem(
      title: "",
      image: UIImage(named: "heart"),
      selectedImage: nil
    )
    controllers.append(favoritesController)

    let searchContoller = searchCoordinator.rootViewController
    searchContoller.tabBarItem = UITabBarItem(
      title: "",
      image: UIImage(named: "magnifyingglass"),
      selectedImage: nil
    )
    controllers.append(searchContoller)

    tabBarController.setViewControllers(controllers, animated: true)
    tabBarController.tabBar.backgroundColor = .BG
    tabBarController.tabBar.tintColor = .main
  }
}
