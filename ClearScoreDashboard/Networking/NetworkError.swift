//
//  NetworkError.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 22/11/2021.
//

import Foundation

enum NetworkError: Error {
  
  case missingUrl, apiError(Error), invalidResponse, other(Error)
  
  var locolizedDescription: String {
    switch self {
    case .missingUrl:
      return "Wrong URL"
    case let .apiError(error):
      return error.localizedDescription
    case .invalidResponse:
      return "No successful response from server"
    case let .other(error):
      return error.localizedDescription
    }
  }
}
