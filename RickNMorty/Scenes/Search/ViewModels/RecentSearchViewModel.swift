//
//  RecentSearchViewModel.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 20.06.2022.
//

import Foundation
import Combine

final class RecentSearchViewModel: ObservableObject {
  struct Model {
    let title: String
    let collection: [URL]
  }

  @Published var data: [Model] = []

  func getRecents() {
    data = [
      Model(
        title: "Recent",
        collection: [
          URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
          URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!,
          URL(string: "https://rickandmortyapi.com/api/character/avatar/3.jpeg")!,
          URL(string: "https://rickandmortyapi.com/api/character/avatar/4.jpeg")!
        ]
      )
    ]
  }
}
