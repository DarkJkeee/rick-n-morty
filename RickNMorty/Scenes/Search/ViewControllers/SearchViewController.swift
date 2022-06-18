//
//  SearchViewController.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 01.05.2022.
//

import Foundation
import UIKit

final class SearchViewController: UIViewController {
  struct Model {
    let title: String
    let collection: [URL]
  }

  private let data: [Model]

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.backgroundColor = .BG
    tableView.separatorStyle = .none
    tableView.register(
      SearchIdleTableViewCell.self,
      forCellReuseIdentifier: SearchIdleTableViewCell.reuseIdentifier
    )
    return tableView
  }()

  init(data: [Model]) {
    self.data = data
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
  }

  private func addSubviews() {
    view.addSubview(tableView)
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

extension SearchViewController: UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return data.count
  }

  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: SearchIdleTableViewCell.reuseIdentifier,
      for: indexPath
    ) as! SearchIdleTableViewCell
    cell.configureCell(with: data[indexPath.row])
    return cell
  }

  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    return UITableView.automaticDimension
  }
}
