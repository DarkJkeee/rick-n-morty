//
//  RecentSearchViewController.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 01.05.2022.
//

import Foundation
import UIKit
import Combine

final class RecentSearchViewController: UIViewController {
  weak var coordinator: SearchCoordinator?

  private let viewModel: RecentSearchViewModel
  private var cancellables = Set<AnyCancellable>()

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.backgroundColor = .BG
    tableView.separatorStyle = .none
    tableView.register(
      RecentSearchTableViewCell.self,
      forCellReuseIdentifier: RecentSearchTableViewCell.reuseIdentifier
    )
    return tableView
  }()

  init(viewModel: RecentSearchViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .BG
    addSubviews()
    addConstraints()
    addBindings()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewModel.getRecents()
  }

  private func addSubviews() {
    view.addSubview(tableView)
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

  private func addConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
    ])
  }
}

extension RecentSearchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: RecentSearchTableViewCell.reuseIdentifier,
      for: indexPath
    ) as! RecentSearchTableViewCell

    let topic = RecentSearchViewModel.Topic.allCases[indexPath.row]
    cell.configureCell(
      with: viewModel.data[topic] ?? [],
      title: topic.rawValue,
      coordinator: coordinator
    )
    return cell
  }
}
