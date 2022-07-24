//
//  Storage.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 26.06.2022.
//

import Foundation

@propertyWrapper
struct CodableUserDefaults<Value: Codable> {
  let key: String
  let defaultValue: Value
  private let container: UserDefaults = .standard

  var wrappedValue: Value {
    get {
      guard let data = container.data(forKey: key),
            let object = try? JSONDecoder().decode(Value.self, from: data) else {
              return defaultValue
            }

      return object
    }
    set {
      container.set(try? JSONEncoder().encode(newValue), forKey: key)
    }
  }
}
