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
  private let storage: AppStorage
  private let suggestViewModel: SuggestViewModel
  private let recentSearchViewModel: RecentSearchViewModel

  private lazy var searchViewController = SearchViewController(
    suggestViewModel: suggestViewModel,
    recentSearchViewModel: recentSearchViewModel
  )
  private lazy var recentSearchViewController = RecentSearchViewController(viewModel: recentSearchViewModel)
  private lazy var suggestViewController = SuggestViewController(viewModel: suggestViewModel)
  
  var childCoordinators = [Coordinator]()
  var rootViewController: UIViewController {
    return navigationController
  }

  init(
    navigationController: UINavigationController,
    storage: AppStorage
  ) {
    self.navigationController = navigationController
    self.storage = storage
    self.suggestViewModel = SuggestViewModel()
    self.recentSearchViewModel = RecentSearchViewModel(storage: storage)
  }

  func start() {
    searchViewController.coordinator = self
    suggestViewController.coordinator = self
    recentSearchViewController.coordinator = self
    searchViewController.add(asChildViewController: recentSearchViewController)
    navigationController.setViewControllers([searchViewController], animated: true)
  }

  func showRecentSearchView() {
    searchViewController.remove(asChildViewController: suggestViewController)
    searchViewController.add(asChildViewController: recentSearchViewController)
  }

  func showSuggestSearchView() {
    searchViewController.remove(asChildViewController: recentSearchViewController)
    searchViewController.add(asChildViewController: suggestViewController)
  }

  func showScreen(character: Character) {
    let vc = CharacterViewController(viewModel: CharacterViewModel(
      character: character,
      storage: storage
    ))
    navigationController.pushViewController(vc, animated: true)
  }
}
