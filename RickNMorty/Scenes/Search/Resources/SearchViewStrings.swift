//
//  Strings.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 07.08.2022.
//

import Foundation

struct SearchViewStrings {
  let omniboxPlaceholderLabel: String
}

extension SearchViewStrings {
  init() {
    self.init(
      omniboxPlaceholderLabel: NSLocalizedString(
        "omnibox_placeholder",
        comment: ""
      )
    )
  }
}
