//
//  SearchCoordinator.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 18.06.2022.
//

import Foundation
import UIKit

final class SearchCoordinator: Coordinator {
  private let navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  var rootViewController: UIViewController {
    return navigationController
  }

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let vc = SearchViewController(data: [
      SearchViewController.Model(title: "Hello", collection: [URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!, URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!, URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!, URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!]),
      SearchViewController.Model(title: "Hello 2", collection: []),
      SearchViewController.Model(title: "Hello 3", collection: []),
      SearchViewController.Model(title: "Hello 3", collection: []),
    ])
    navigationController.setViewControllers([vc], animated: true)
  }
}
