//
//  RecentSearchTableViewCell.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 01.05.2022.
//

import Foundation
import UIKit

final class RecentSearchTableViewCell: UITableViewCell {
  private weak var coordinator: SearchCoordinator?
  private var characters: [Character] = []

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 20
    return layout
  }()

  private lazy var title: UILabel = {
    let label = UILabel()
    label.textColor = .main
    label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    return label
  }()

  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(
      frame: .zero,
      collectionViewLayout: flowLayout
    )

    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .BG
    collectionView.dataSource = self
    collectionView.delegate = self

    collectionView.register(
      RecentSearchCollectionViewCell.self,
      forCellWithReuseIdentifier: RecentSearchCollectionViewCell.reuseIdentifier
    )
    return collectionView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .BG
    addSubviews()
    addConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureCell(
    with characters: [Character],
    title: String,
    coordinator: SearchCoordinator?
  ) {
    self.characters = characters
    self.title.text = title
    self.coordinator = coordinator
    collectionView.reloadData()
  }

  private func addSubviews() {
    contentView.addSubview(title)
    contentView.addSubview(collectionView)
  }

  private func addConstraints() {
    [title, collectionView]
      .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    NSLayoutConstraint.activate([
      title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      collectionView.heightAnchor.constraint(equalToConstant: 160),
    ])
  }
}

extension RecentSearchTableViewCell: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return characters.count
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: RecentSearchCollectionViewCell.reuseIdentifier,
      for: indexPath
    ) as! RecentSearchCollectionViewCell
    cell.configureCell(with: URL(string: characters[indexPath.row].image))
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    coordinator?.showScreen(character: characters[indexPath.row])
  }
}

extension RecentSearchTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(width: 120, height: 160)
  }
}

extension RecentSearchTableViewCell: UICollectionViewDelegate {}
