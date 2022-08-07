//
//  RecentSearchViewModel.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 20.06.2022.
//

import Foundation
import Combine

final class RecentSearchViewModel: ObservableObject {
  enum Topic: String, CaseIterable {
    case recents = "recent_topic"

    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
  }

  private let storage: AppStorage
  @Published var data: [Topic: [Character]] = [:]

  init(storage: AppStorage) {
    self.storage = storage
  }

  func getRecents() {
    data[.recents] = storage.recentCharacters
  }
}
