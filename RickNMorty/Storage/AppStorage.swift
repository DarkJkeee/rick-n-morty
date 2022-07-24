//
//  Storage.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 26.06.2022.
//

import Foundation

final class AppStorage {
  @CodableUserDefaults<[Character]>(key: "recent_characters", defaultValue: [])
  var recentCharacters: [Character]
}
