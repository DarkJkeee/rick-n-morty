//
//  SuggestViewController.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 18.06.2022.
//

import Foundation
import UIKit
import Combine

final class SuggestViewController: UIViewController {
  weak var coordinator: SearchCoordinator?

  private var cancellables = Set<AnyCancellable>()
  private let viewModel: SuggestViewModel

  private lazy var suggestTableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(
      SuggestTableViewCell.self,
      forCellReuseIdentifier: SuggestTableViewCell.reuseIdentifier
    )
    tableView.backgroundColor = .BG
    return tableView
  }()

  init(viewModel: SuggestViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    addSubviews()
    addConstraints()
    addBindings()
  }

  private func addSubviews() {
    view.addSubview(suggestTableView)
  }

  private func addConstraints() {
    suggestTableView.pinTo(view: view)
  }

  private func addBindings() {
    viewModel
      .$data
      .receive(on: RunLoop.main)
      .sink { [weak self] _ in
        self?.suggestTableView.reloadData()
      }
      .store(in: &cancellables)
  }
}

extension SuggestViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: SuggestTableViewCell.reuseIdentifier,
      for: indexPath
    ) as! SuggestTableViewCell
    cell.configureCell(
      with: SuggestTableViewCell.Model(
        imageURL: URL(string: viewModel.data[indexPath.row].image),
        characterInfoModel: CharacterInfoView.Model(
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
}

extension SuggestViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 199
  }
}
