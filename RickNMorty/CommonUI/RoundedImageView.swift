//
//  RoundedImageView.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 05.05.2022.
//

import Foundation
import UIKit

class RoundedImageView: UIImageView {
  init() {
    super.init(frame: .zero)
    configureView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureView() {
    clipsToBounds = true
    contentMode = .scaleAspectFill
    layer.borderColor = UIColor.main.cgColor
    layer.borderWidth = traitCollection.userInterfaceStyle.borderWidth
    layer.cornerRadius = 10
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    layer.borderWidth = traitCollection.userInterfaceStyle.borderWidth
  }
}

extension UIUserInterfaceStyle {
  fileprivate var borderWidth: CGFloat {
    switch self {
    case .dark: return 0
    case .light, .unspecified: return 1
    @unknown default: fatalError()
    }
  }
}
