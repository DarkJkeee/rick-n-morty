//
//  CharacterViewController.swift
//  RickNMorty
//
//  Created by Gleb Burstein on 29.04.2022.
//

import Foundation
import UIKit
import Kingfisher

final class CharacterViewController: UIViewController {
  private let viewModel: CharacterViewModel

  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    return scrollView
  }()

  private lazy var characterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.kf.setImage(with: URL(string: viewModel.character.image))
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 10
    return imageView
  }()

  private lazy var characterTitleView: UIView = {
    let view = CharacterTitleView(
      model: CharacterTitleView.Model(
        name: viewModel.character.name,
        action: {
          print("Hello")
        }
      )
    )
    return view
  }()

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.addArrangedSubview(CharacterInfoCell(
      model: CharacterInfoCell.Model(title: "Status:", value: viewModel.character.status)
    ))
    stackView.addArrangedSubview(CharacterInfoCell(
      model: CharacterInfoCell.Model(title: "Species:", value: viewModel.character.species)
    ))
    stackView.addArrangedSubview(CharacterInfoCell(
      model: CharacterInfoCell.Model(title: "Gender:", value: viewModel.character.gender)
    ))
    stackView.spacing = 16
    stackView.addHorizontalSeparators(color: .main)
    return stackView
  }()

  init(viewModel: CharacterViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.tintColor = .main
    view.backgroundColor = .BG
    addSubviews()
    addConstraints()
    viewModel.addRecentCharacter()
  }

  private func addSubviews() {
    view.addSubview(scrollView)
    scrollView.addSubview(characterImageView)
    scrollView.addSubview(characterTitleView)
    scrollView.addSubview(stackView)
  }

  private func addConstraints() {
    [scrollView, stackView, characterTitleView, characterImageView]
      .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    scrollView.pinTo(view: view)

    NSLayoutConstraint.activate([
      characterImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      characterImageView.widthAnchor.constraint(equalToConstant: 300),
      characterImageView.heightAnchor.constraint(equalToConstant: 300),
      characterImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
      characterTitleView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 32),
      characterTitleView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
      characterTitleView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16)
    ])

    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: characterTitleView.bottomAnchor, constant: 16),
      stackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
      stackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
    ])
  }
}

extension UIStackView {
  fileprivate func addHorizontalSeparators(color : UIColor) {
    var i = self.arrangedSubviews.count
    while i > 0 {
      let separator = createSeparator(color: color)
      insertArrangedSubview(separator, at: i)
      separator.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
      i -= 1
    }
  }
}

private func createSeparator(color : UIColor) -> UIView {
  let separator = UIView()
  separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
  separator.backgroundColor = color
  return separator
}
