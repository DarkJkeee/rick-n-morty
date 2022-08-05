//
//  TopView.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 29.07.2022.
//

import Foundation
import UIKit

final class TopView: UIView {
  private lazy var title: UILabel = {
    let label = UILabel()
    label.text = "RICK AND MORTY"
    label.numberOfLines = 3
    label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
    label.textColor = .main
    return label
  }()

  private lazy var subtitle: UILabel = {
    let label = UILabel()
    label.text = "CHARACTER BOOK"
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 42, weight: .black)
    label.textColor = .main
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .BG
    addSubviews()
    addConstrains()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addSubviews() {
    addSubview(title)
    addSubview(subtitle)
  }

  private func addConstrains() {
    [title, subtitle].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    NSLayoutConstraint.activate([
      title.topAnchor.constraint(equalTo: topAnchor),
      title.leadingAnchor.constraint(equalTo: leadingAnchor),
      title.trailingAnchor.constraint(equalTo: trailingAnchor),
      title.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: 24),
      subtitle.leadingAnchor.constraint(equalTo: leadingAnchor),
      subtitle.trailingAnchor.constraint(equalTo: trailingAnchor),
      subtitle.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }

}
