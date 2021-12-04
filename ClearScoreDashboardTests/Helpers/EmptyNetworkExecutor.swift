//
//  EmptyNetworkExecutor.swift
//  ClearScoreDashboardTests
//
//  Created by Andras Pal on 04/12/2021.
//

import XCTest
@testable import ClearScoreDashboard

struct EmptyNetworkExecutor: NetworkExecutor {
  
  private let expectedURL: URL
  
  init(expectedURL: URL) {
    self.expectedURL = expectedURL
  }
  
  func executeRequest(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
    
    XCTAssertEqual(url, self.expectedURL)
    
    let emptyData = Data()
    let urlResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
    let error: Error? = nil
    
    completionHandler(emptyData, urlResponse, error)
  }
}
