//
//  CharacterInfoCell.swift
//  RickNMorty
//
//  Created by Gleb Burstein on 29.04.2022.
//

import Foundation
import UIKit

final class CharacterInfoCell: UIView {
  struct Model {
    let title: String
    let value: String
  }

  private let model: Model

  private lazy var title: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.textColor = .secondary
    label.text = model.title
    return label
  }()

  private lazy var value: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.textColor = .main
    label.text = model.value
    return label
  }()

  init(model: Model) {
    self.model = model
    super.init(frame: .zero)
    addSubviews()
    addConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addSubviews() {
    addSubview(title)
    addSubview(value)
  }

  private func addConstraints() {
    title.translatesAutoresizingMaskIntoConstraints = false
    value.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      title.leadingAnchor.constraint(equalTo: leadingAnchor),
      title.topAnchor.constraint(equalTo: topAnchor),
      value.topAnchor.constraint(equalTo: title.bottomAnchor),
      value.leadingAnchor.constraint(equalTo: leadingAnchor),
      value.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
