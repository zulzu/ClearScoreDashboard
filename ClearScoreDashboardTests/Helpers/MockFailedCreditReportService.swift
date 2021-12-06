//
//  MockFailedCreditReportService.swift
//  ClearScoreDashboardTests
//
//  Created by Andras Pal on 06/12/2021.
//

import XCTest
@testable import ClearScoreDashboard

class MockFailedCreditReportService: CreditReportService {
  
  let error: NetworkError = NetworkError.invalidResponse
  
  func fetchCreditReport(completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void) {
    completion(.failure(error))
  }
}
