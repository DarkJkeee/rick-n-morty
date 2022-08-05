//
//  HomeViewController.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 25.07.2022.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
  private lazy var topView: TopView = TopView()
  
  override func viewDidLoad() {
    view.backgroundColor = .BG
    view.addSubview(topView)
    addConstraints()
  }

  private func addConstraints() {
    topView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      topView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}
