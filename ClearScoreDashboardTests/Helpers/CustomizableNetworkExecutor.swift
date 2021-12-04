//
//  CustomizableNetworkExecutor.swift
//  ClearScoreDashboardTests
//
//  Created by Andras Pal on 04/12/2021.
//

import XCTest
@testable import ClearScoreDashboard

struct CustomizableNetworkExecutor: NetworkExecutor {
  
  let behaviour: NetworkExecutorBehavior
  
  private let expectedURL: URL
  
  let emptyResponse = Data()
  
  let nonDecodableMockData = """
  {
    "creditReportInfo":
        {
         "score":"Never gonna give you up",
      }
  }
  """.data(using: .utf8)!
  
  let emptyMockData = """
  {
  "creditReportInfo":{
  }
  }
  """.data(using: .utf8)!
  
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
  
  init(behaviour: NetworkExecutorBehavior, expectedURL: URL) {
    self.behaviour = behaviour
    self.expectedURL = expectedURL
  }
  
  func executeRequest(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
    
    XCTAssertEqual(url, self.expectedURL)
    
    var dataResponse = Data()
    let urlResponse = HTTPURLResponse(url: url, statusCode: (behaviour == .invalidStatusCode) ? 400 : 200, httpVersion: nil, headerFields: nil)
    let error: Error? = nil
    
    switch behaviour {
    case .invalidStatusCode:
      dataResponse = mockData
    case .nonDecodableData:
      dataResponse = nonDecodableMockData
    case .emptyResponse:
      dataResponse = emptyResponse
    case .emptyData:
      dataResponse = emptyMockData
    case .mockDataReceived:
      dataResponse = mockData
    }
    
    completionHandler(dataResponse, urlResponse, error)
  }
}
