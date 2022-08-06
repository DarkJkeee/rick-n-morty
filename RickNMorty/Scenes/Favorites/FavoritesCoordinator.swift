//
//  FavoritesCoordinator.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 18.06.2022.
//

import Foundation
import UIKit

final class FavoritesCoordinator: Coordinator {
  private let navigationController: UINavigationController
  private let favoritesViewModel: FavoritesViewModel
  private let storage: AppStorage

  private lazy var favoritesViewController = FavoritesViewController(
    viewModel: favoritesViewModel
  )

  var rootViewController: UIViewController {
    return navigationController
  }

  init(navigationController: UINavigationController, storage: AppStorage) {
    self.navigationController = navigationController
    self.storage = storage
    favoritesViewModel = FavoritesViewModel(storage: storage)
  }

  func start() {
    favoritesViewController.coordinator = self
    navigationController.setViewControllers([favoritesViewController], animated: true)
  }

  func showScreen(character: Character) {
    let vc = CharacterViewController(viewModel: CharacterViewModel(
      character: character,
      storage: storage
    ))
    navigationController.pushViewController(vc, animated: true)
  }
}
