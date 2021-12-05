//
//  ClearScoreData.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 22/11/2021.
//

import Foundation

// MARK: - ClearScore
struct ClearScoreData: Codable, Equatable {
  let creditReportInfo: CreditReportInfo
}

// MARK: - CreditReportInfo
struct CreditReportInfo: Codable, Equatable {
  let score: Int?
  let percentageCreditUsed: Int?
  let currentShortTermDebt: Int?
  let currentShortTermCreditLimit: Int?
  let currentLongTermDebt: Int?
  let daysUntilNextReport: Int?
  let maxScoreValue: Int?
}
