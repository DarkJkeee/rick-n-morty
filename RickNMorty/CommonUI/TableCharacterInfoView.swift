//
//  TableCharacterInfoView.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 11.05.2022.
//

import Foundation
import UIKit

final class TableCharacterInfoView: UIView {
  struct Model {
    let name: String
    let species: String
  }

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    
    return stackView
  }()

  private lazy var name: UILabel = {
    let label = UILabel()
    label.textColor = .main
    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.numberOfLines = 2
    return label
  }()

  private lazy var species: UILabel = {
    let label = UILabel()
    label.textColor = .secondary
    label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews()
    addConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureView(with model: Model) {
    name.text = model.name
    species.text = model.species
  }

  private func addSubviews() {
    addSubview(name)
    addSubview(species)
  }

  private func addConstraints() {
    [name, species].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    NSLayoutConstraint.activate([
      name.topAnchor.constraint(equalTo: topAnchor),
      name.leadingAnchor.constraint(equalTo: leadingAnchor),
      species.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
      species.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
