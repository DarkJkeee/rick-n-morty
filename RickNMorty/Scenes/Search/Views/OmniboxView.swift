//
//  OmniboxView.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 18.06.2022.
//

import Foundation
import UIKit

class OmniboxView: UITextField {
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "magnifyingglass"))
    return imageView
  }()

  private lazy var view: UIView = {
    let view = UIView()
    view.addSubview(imageView)
    [view, imageView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
      imageView.topAnchor.constraint(equalTo: view.topAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    placeholder = "Search for character"
    leftView = UIImageView(image: UIImage(named: "magnifyingglass"))
    leftViewMode = .always
    textColor = .main
    tintColor = .main
    layer.borderWidth = 2
    layer.cornerRadius = 10
    layer.borderColor = UIColor.main.cgColor
    leftView = view
    leftViewMode = .always
  }
}
