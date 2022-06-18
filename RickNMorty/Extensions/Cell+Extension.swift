//
//  Cell+Extension.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 05.05.2022.
//

import Foundation
import UIKit

protocol ReusableView {}

extension ReusableView where Self: UIView {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

extension UITableViewCell: ReusableView {}
extension UICollectionViewCell: ReusableView {}
