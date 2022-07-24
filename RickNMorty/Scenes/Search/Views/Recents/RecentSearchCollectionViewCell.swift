//
//  RecentSearchCollectionViewCell.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 04.05.2022.
//

import Foundation
import UIKit

final class RecentSearchCollectionViewCell: UICollectionViewCell {
  private let imageView = RoundedImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews()
    addConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureCell(with url: URL?) {
    imageView.kf.setImage(with: url)
  }

  private func addSubviews() {
    addSubview(imageView)
  }

  private func addConstraints() {
    imageView.pinTo(view: self)
  }
}
