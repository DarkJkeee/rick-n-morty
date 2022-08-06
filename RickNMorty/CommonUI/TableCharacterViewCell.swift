//
//  TableCharacterViewCell.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 11.05.2022.
//

import Foundation
import UIKit

final class TableCharacterViewCell: UITableViewCell {
  struct Model {
    let imageURL: URL?
    let characterInfoModel: TableCharacterInfoView.Model
  }

  private let characterImage = RoundedImageView()
  private let infoView = TableCharacterInfoView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .BG
    addSubviews()
    addConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureCell(with model: Model) {
    characterImage.kf.setImage(with: model.imageURL)
    infoView.configureView(with: model.characterInfoModel)
  }

  private func addSubviews() {
    addSubview(characterImage)
    addSubview(infoView)
  }

  private func addConstraints() {
    [characterImage, infoView]
      .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    NSLayoutConstraint.activate([
      characterImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      characterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      characterImage.widthAnchor.constraint(equalToConstant: 120),
      characterImage.heightAnchor.constraint(equalToConstant: 160),
      infoView.centerYAnchor.constraint(equalTo: characterImage.centerYAnchor),
      infoView.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 24)
    ])
  }
}
