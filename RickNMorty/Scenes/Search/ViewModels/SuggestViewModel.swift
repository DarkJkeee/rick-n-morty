//
//  SearchViewModel.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 19.06.2022.
//

import Foundation
import Combine

final class SuggestViewModel: ObservableObject {
  private struct Response: Decodable {
    let results: [Character]
  }

  private let apiURL = URL(string: "https://rickandmortyapi.com/api/character/")!
  private var cancellables = Set<AnyCancellable>()
  @Published var data: [Character] = []

  func fetchSearch(with query: String) {
    URLSession.shared.publisher(for: Request<Response>(
      url: apiURL,
      method: .get([URLQueryItem(name: "name", value: query)])
    ))
      .map(\.results)
      .replaceError(with: [])
      .sink { [weak self] in
        self?.data = $0
      }
      .store(in: &cancellables)
  }
}
