//
//  URLSession.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 22/11/2021.
//

import Foundation

extension URLSession: NetworkExecutor {
  
  func executeRequest(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
    self.dataTask(with: url, completionHandler: completionHandler)
      .resume()
  }
}
