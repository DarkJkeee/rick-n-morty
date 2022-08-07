//
//  FavoritesSceneStrings.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 07.08.2022.
//

import Foundation

struct FavoritesViewStrings {
  let favoritesTitle: String
}

extension FavoritesViewStrings {
  init() {
    self.init(
      favoritesTitle: NSLocalizedString(
        "favorites_title",
        comment: ""
      )
    )
  }
}
