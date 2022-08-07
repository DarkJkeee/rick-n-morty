//
//  CharacterViewStrings.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 07.08.2022.
//

import Foundation

struct CharacterViewStrings {
  let statusLabel: String
  let speciesLabel: String
  let genderLabel: String
}

extension CharacterViewStrings {
  init() {
    self.init(
      statusLabel: NSLocalizedString("status_title", comment: ""),
      speciesLabel: NSLocalizedString("species_title", comment: ""),
      genderLabel: NSLocalizedString("gender_title", comment: "")
    )
  }
}
