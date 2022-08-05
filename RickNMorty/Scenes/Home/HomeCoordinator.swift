//
//  HomeCoordinator.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 18.06.2022.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
  private let navigationController: UINavigationController
  private lazy var homeViewController = HomeViewController()

  var rootViewController: UIViewController {
    return navigationController
  }

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    navigationController.setViewControllers([homeViewController], animated: true)
  }
}
