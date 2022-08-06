//
//  FavoritesViewModel.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 06.08.2022.
//

import Foundation
import Combine

final class FavoritesViewModel: ObservableObject {
  private let storage: AppStorage
  @Published var data: [Character] = []

  init(storage: AppStorage) {
    self.storage = storage
  }

  func getFavorites() {
    data = storage.favoritesCharacters
  }
}
