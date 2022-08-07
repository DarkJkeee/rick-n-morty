//
//  FavoritesViewController.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 06.08.2022.
//

import Foundation
import UIKit
import Combine

final class FavoritesViewController: UIViewController {
  private let viewModel: FavoritesViewModel
  private let strings: FavoritesViewStrings
  private var cancellables = Set<AnyCancellable>()

  weak var coordinator: FavoritesCoordinator?
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(
      TableCharacterViewCell.self,
      forCellReuseIdentifier: TableCharacterViewCell.reuseIdentifier
    )
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = .BG
    return tableView
  }()

  init(viewModel: FavoritesViewModel, strings: FavoritesViewStrings) {
    self.viewModel = viewModel
    self.strings = strings
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = strings.favoritesTitle
    navigationController?.navigationBar.prefersLargeTitles = true
    addSubviews()
    addConstraints()
    addBindings()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewModel.getFavorites()
  }

  private func addSubviews() {
    view.addSubview(tableView)
  }

  private func addConstraints() {
    tableView.pinTo(view: view)
  }

  private func addBindings() {
    viewModel
      .$data
      .receive(on: RunLoop.main)
      .sink { [weak self] _ in
        self?.tableView.reloadData()
      }
      .store(in: &cancellables)
  }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if viewModel.data.isEmpty {
      tableView.setEmptyMessage("No favorites yet")
    } else {
      tableView.restore()
    }
    return viewModel.data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: TableCharacterViewCell.reuseIdentifier,
      for: indexPath
    ) as! TableCharacterViewCell
    cell.configureCell(
      with: TableCharacterViewCell.Model(
        imageURL: URL(string: viewModel.data[indexPath.row].image),
        characterInfoModel: TableCharacterInfoView.Model(
          name: viewModel.data[indexPath.row].name,
          species: viewModel.data[indexPath.row].species
        )
      )
    )
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    coordinator?.showScreen(character: viewModel.data[indexPath.row])
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
}
