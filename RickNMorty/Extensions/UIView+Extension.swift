//
//  UIView+Extension.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 02.05.2022.
//

import Foundation
import UIKit

extension UIView {
  func pinTo(view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: view.topAnchor),
      trailingAnchor.constraint(equalTo: view.trailingAnchor),
      bottomAnchor.constraint(equalTo: view.bottomAnchor),
      leadingAnchor.constraint(equalTo: view.leadingAnchor),
    ])
  }
}
