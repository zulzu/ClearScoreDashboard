//
//  ScoreDashboardVMTests.swift
//  ClearScoreDashboardTests
//
//  Created by Andras Pal on 05/12/2021.
//

import XCTest
@testable import ClearScoreDashboard

class ScoreDashboardVMTests: XCTestCase {
  
  func testCreditReport() {
    
    let creditReportStub = CreditReportStub()
    let creditReport = creditReportStub.creditReportInfo
    let sut = ScoreDashboardVM(networkProvider: MockCreditReportService(creditReport: creditReport),
                               mainExecutor: { work in work() },
                               creditRepDidUpdate: {})
    
    sut.fetchCreditReportInfo()
    XCTAssertEqual(sut.creditReport?.score, creditReport.score)
    XCTAssertFalse(sut.creditReport?.maxScoreValue == 5)
    XCTAssertTrue(sut.creditReport?.daysUntilNextReport == 1)
  }
  
  func testCreditReportError() {
    
    let sut = ScoreDashboardVM(networkProvider: MockFailedCreditReportService(),
                               mainExecutor: { work in work() },
                               creditRepDidUpdate: {})
    
    sut.fetchCreditReportInfo()
    XCTAssertTrue(sut.netErr?.locolizedDescription == NetworkError.invalidResponse.locolizedDescription)
    XCTAssertFalse(sut.creditReport != nil)
  }
}
