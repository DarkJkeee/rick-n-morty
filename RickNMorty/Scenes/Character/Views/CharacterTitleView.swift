//
//  CharacterTitleView.swift
//  RickNMorty
//
//  Created by Gleb Burstein on 30.04.2022.
//

import Foundation
import UIKit

final class CharacterTitleView: UIView {
  struct Model {
    let name: String
    let isFavorite: Bool
    let action: (Action) -> ()
  }

  private let model: Model

  private lazy var characterName: UILabel = {
    let label = UILabel()
    label.text = model.name
    label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
    label.textColor = .main
    return label
  }()

  private lazy var likeButton: UIButton = {
    var configuration = UIButton.Configuration.filled()
    configuration.buttonSize = .large
    configuration.cornerStyle = .capsule
    configuration.baseBackgroundColor = .greyBG
    configuration.baseForegroundColor = .main
    configuration.image = UIImage(systemName: "heart")
    let handler: UIButton.ConfigurationUpdateHandler = { button in
      if button.isSelected {
        button.configuration?.baseBackgroundColor = .main
        button.configuration?.baseForegroundColor = .greyBG
        button.configuration?.image = UIImage(systemName: "heart.fill")
      } else {
        button.configuration?.baseBackgroundColor = .greyBG
        button.configuration?.baseForegroundColor = .main
        button.configuration?.image = UIImage(systemName: "heart")
      }
    }
    let button = UIButton(configuration: configuration)
    button.isSelected = model.isFavorite
    button.configurationUpdateHandler = handler
    button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    return button
  }()

  init(model: Model) {
    self.model = model
    super.init(frame: .zero)
    addSubviews()
    addConstrains()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addSubviews() {
    addSubview(characterName)
    addSubview(likeButton)
  }

  private func addConstrains() {
    [characterName, likeButton]
      .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    NSLayoutConstraint.activate([
      characterName.leadingAnchor.constraint(equalTo: leadingAnchor),
      characterName.centerYAnchor.constraint(equalTo: centerYAnchor),
      heightAnchor.constraint(equalToConstant: 48),
      likeButton.heightAnchor.constraint(equalToConstant: 48),
      likeButton.widthAnchor.constraint(equalToConstant: 48),
      likeButton.trailingAnchor.constraint(equalTo: trailingAnchor),
      likeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }

  @objc private func likeButtonTapped() {
    model.action {
      likeButton.isSelected.toggle()
    }
  }
}
