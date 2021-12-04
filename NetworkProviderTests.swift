//
//  NetworkProviderTests.swift
//  ClearScoreDashboardTests
//
//  Created by Andras Pal on 04/12/2021.
//

import XCTest
@testable import ClearScoreDashboard

class NetworkProviderTests: XCTestCase {
  
  static let productURL = URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values")
  
  func testNetwork_withEmptyResponse() {
    
    let sut = NetworkProvider(requestExecutor: CustomizableNetworkExecutor(behaviour: .emptyResponse, expectedURL: NetworkProviderTests.productURL!))
    
    sut.fetchCreditReport { result in
      
      switch result {
      case .success:
        XCTFail("It should not succeed")
      case .failure(let error):
        switch error {
        case .missingUrl:
          XCTFail("The URL is missing")
        case .invalidResponse:
          XCTFail("Invalid response from the server")
        case .apiError:
          XCTFail("API error")
        case .other(let internalError):
          XCTAssertTrue(internalError is DecodingError)
        }
      }
    }
  }
  
  func testNetwork_withEmptyData() {
    
    let sut = NetworkProvider(requestExecutor: CustomizableNetworkExecutor(behaviour: .emptyData, expectedURL: NetworkProviderTests.productURL!))

    sut.fetchCreditReport { result in
      switch result {
      case .success(let creditReport):
        XCTAssertEqual(creditReport.score, nil)
      case .failure:
        XCTFail("It should not fail...")
      }
    }
  }
  
  func testNetwork_withMockResponse() {
    
    let sut = NetworkProvider(requestExecutor: CustomizableNetworkExecutor(behaviour: .mockDataReceived, expectedURL: NetworkProviderTests.productURL!))
    let creditReportStub = CreditReportStub()
    let report = creditReportStub.creditReportInfo
    
    sut.fetchCreditReport { result in
      
      switch result {
      case .success(let creditReport):
        XCTAssertEqual(creditReport.score, 333)
        XCTAssertEqual(creditReport, report)
      case .failure:
        XCTFail("Couldn't access the mock data")
      }
    }
  }
  
  func testNetwork_withNonDecodableResponse() {
    
    let sut = NetworkProvider(requestExecutor: CustomizableNetworkExecutor(behaviour: .nonDecodableData, expectedURL: NetworkProviderTests.productURL!))

    sut.fetchCreditReport { result in
      
      switch result {
      case .success:
        XCTFail("The mock data shouldn't be decodable")
      case .failure(let error):
        switch error {
        case .other(let mockDataError):
          XCTAssertTrue(mockDataError is DecodingError)
        default:
          XCTFail("The error is the wrong value")
        }
      }
    }
  }
  
  func testNetwork_withWrongStatusCode() {
    
    let sut = NetworkProvider(requestExecutor: CustomizableNetworkExecutor(behaviour: .invalidStatusCode, expectedURL: NetworkProviderTests.productURL!))

    sut.fetchCreditReport { result in
      
      switch result {
      case .success:
        XCTFail("Should have a wrong status code")
      case .failure(let error):
        switch error {
        case .invalidResponse:
          XCTAssertEqual(error.locolizedDescription, "No successful response from server")
        default:
          XCTFail("The error is the wrong value")
        }
      }
    }
  }
}
