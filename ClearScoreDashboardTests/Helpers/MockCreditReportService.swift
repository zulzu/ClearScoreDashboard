//
//  MockCreditReportService.swift
//  ClearScoreDashboardTests
//
//  Created by Andras Pal on 05/12/2021.
//

import XCTest
@testable import ClearScoreDashboard

class MockCreditReportService: CreditReportService {
  
  let creditReport: CreditReportInfo
  
  func fetchCreditReport(completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void) {
    completion(.success(creditReport))
  }
  
  init(creditReport: CreditReportInfo) {
    self.creditReport = creditReport
  }
}
