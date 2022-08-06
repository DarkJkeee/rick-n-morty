//
//  CharacterViewModel.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 26.06.2022.
//

import Foundation

final class CharacterViewModel {
  private let storage: AppStorage
  let character: Character

  init(character: Character, storage: AppStorage) {
    self.character = character
    self.storage = storage
  }

  func addRecentCharacter() {
    storage.recentCharacters.append(character)
  }

  func favoriteCharacterChanged() {
    if isCharacterFavorite() {
      removeFavoriteCharacter()
    } else {
      addFavoriteCharacter()
    }
  }

  func isCharacterFavorite() -> Bool {
    storage.favoritesCharacters.contains(character)
  }

  private func addFavoriteCharacter() {
    storage.favoritesCharacters.append(character)
  }

  private func removeFavoriteCharacter() {
    storage.favoritesCharacters.removeAll { $0 == character }
  }
}
