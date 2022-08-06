//
//  UITableView+Extension.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 06.08.2022.
//

import Foundation
import UIKit

extension UITableView {
  func setEmptyMessage(_ message: String) {
    let messageLabel = UILabel(frame: CGRect(
      x: 0,
      y: 0,
      width: self.bounds.size.width,
      height: self.bounds.size.height
    ))
    messageLabel.text = message
    messageLabel.textColor = .main
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    messageLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
    messageLabel.sizeToFit()

    self.backgroundView = messageLabel
  }

  func restore() {
    self.backgroundView = nil
  }
}
