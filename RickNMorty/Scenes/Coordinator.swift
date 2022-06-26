//
//  Coordinator.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 17.06.2022.
//

import Foundation
import UIKit

protocol Coordinator {
  var childCoordinators: [Coordinator] { get set }
  func start()
}
