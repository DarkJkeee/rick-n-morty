//
//  SearchViewController.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 18.06.2022.
//

import Foundation
import UIKit
import Combine

final class SearchViewController: UIViewController {
  weak var coordinator: SearchCoordinator?
  
  private let suggestViewModel: SuggestViewModel
  private let recentSearchViewModel: RecentSearchViewModel
  private var cancellables = Set<AnyCancellable>()

  private lazy var omniboxView = OmniboxView()

  init(
    suggestViewModel: SuggestViewModel,
    recentSearchViewModel: RecentSearchViewModel
  ) {
    self.recentSearchViewModel = recentSearchViewModel
    self.suggestViewModel = suggestViewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .BG
    view.addSubview(omniboxView)
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    [omniboxView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    NSLayoutConstraint.activate([
      omniboxView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      omniboxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      omniboxView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      omniboxView.heightAnchor.constraint(equalToConstant: 55),
    ])

    omniboxView.addTarget(nil, action: #selector(textDidChanged), for: .editingChanged)
    view.addGestureRecognizer(tap)
  }

  func add(asChildViewController viewController: UIViewController) {
    addChild(viewController)
    view.addSubview(viewController.view)

    viewController.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      viewController.view.topAnchor.constraint(equalTo: omniboxView.bottomAnchor, constant: 16),
      viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])

    viewController.didMove(toParent: self)
  }

  func remove(asChildViewController viewController: UIViewController) {
    viewController.willMove(toParent: nil)
    viewController.view.removeFromSuperview()
    viewController.removeFromParent()
  }

  @objc private func textDidChanged(_ textField: UITextField) {
    let text = textField.text ?? ""
    if text.isEmpty {
      coordinator?.showRecentSearchView()
    } else {
      suggestViewModel.fetchSearch(with: text)
      coordinator?.showSuggestSearchView()
    }
  }

  @objc private func dismissKeyboard() {
    view.endEditing(true)
  }
}
