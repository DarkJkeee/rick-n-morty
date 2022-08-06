//
//  Character.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 19.06.2022.
//

import Foundation

struct Character: Codable, Equatable {
  let id: Int
  let name: String
  let status: String
  let species: String
  let gender: String
  let image: String
}
