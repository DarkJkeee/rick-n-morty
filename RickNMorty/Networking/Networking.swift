//
//  Networking.swift
//  rick-n-morty
//
//  Created by Gleb Burstein on 19.06.2022.
//

import Foundation

struct Request<Response> {
  let url: URL
  let method: HttpMethod
  var headers: [String: String] = [:]
}

enum HttpMethod: Equatable {
  case get([URLQueryItem])
  case put(Data?)
  case post(Data?)
  case delete
  case head

  var name: String {
    switch self {
    case .get: return "GET"
    case .put: return "PUT"
    case .post: return "POST"
    case .delete: return "DELETE"
    case .head: return "HEAD"
    }
  }
}
