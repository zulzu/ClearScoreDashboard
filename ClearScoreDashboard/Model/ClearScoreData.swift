//
//  ClearScoreData.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 22/11/2021.
//

import Foundation

// MARK: - ClearScore
struct ClearScoreData: Codable {
  let creditReportInfo: CreditReportInfo
}

// MARK: - CreditReportInfo
struct CreditReportInfo: Codable {
  let score, percentageCreditUsed, currentShortTermDebt, currentShortTermCreditLimit, currentLongTermDebt, daysUntilNextReport: Int
}
