//
//  MockDataNetworkExecutor.swift
//  ClearScoreDashboardTests
//
//  Created by Andras Pal on 04/12/2021.
//

import XCTest
@testable import ClearScoreDashboard

struct MockDataNetworkExecutor: NetworkExecutor {
  
  private let expectedURL: URL
  
  init(expectedURL: URL) {
    self.expectedURL = expectedURL
  }
  
  func executeRequest(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
    
    XCTAssertEqual(url, self.expectedURL)
    
    let mockData = """
  {
   "creditReportInfo":{
  "score":333,
  "percentageCreditUsed":75,
  "currentShortTermDebt":5000,
  "currentShortTermCreditLimit":500,
  "currentLongTermDebt":8000,
  "daysUntilNextReport":1,
  "maxScoreValue":700,
  }
  }
  """.data(using: .utf8)!
    
    let urlResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
    let error: Error? = nil
    
    completionHandler(mockData, urlResponse, error)
  }
}
