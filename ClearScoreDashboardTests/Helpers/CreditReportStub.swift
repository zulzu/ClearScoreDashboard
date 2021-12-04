//
//  CreditReportStub.swift
//  ClearScoreDashboardTests
//
//  Created by Andras Pal on 04/12/2021.
//

import XCTest
@testable import ClearScoreDashboard

struct CreditReportStub {
  
  let creditReportInfo: CreditReportInfo = CreditReportInfo(score: 333,
                                                            percentageCreditUsed: 75,
                                                            currentShortTermDebt: 5000,
                                                            currentShortTermCreditLimit: 500,
                                                            currentLongTermDebt: 8000,
                                                            daysUntilNextReport: 1,
                                                            maxScoreValue: 700)
  
}

