//
//  OmniboxView.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 18.06.2022.
//

import Foundation
import UIKit

final class OmniboxView: UITextField {
  private lazy var imageView = UIImageView(
    image: UIImage(named: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
  )

  private lazy var magnifyingGlassImageView: UIView = {
    let view = UIView()
    view.addSubview(imageView)
    imageView.tintColor = .main
    [view, imageView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
      imageView.topAnchor.constraint(equalTo: view.topAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    return view
  }()

  init(strings: SearchViewStrings) {
    super.init(frame: .zero)
    setupView(placeholderLabel: strings.omniboxPlaceholderLabel)
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    layer.borderColor = UIColor.main.cgColor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView(placeholderLabel: String) {
    clearButtonMode = .whileEditing
    placeholder = placeholderLabel
    leftViewMode = .always
    textColor = .main
    tintColor = .main
    leftView = magnifyingGlassImageView
    layer.borderWidth = 2
    layer.cornerRadius = 10
    layer.borderColor = UIColor.main.cgColor
  }
}
