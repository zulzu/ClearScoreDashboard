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
  let score, scoreBand: Int
  let clientRef, status: String
  let maxScoreValue, minScoreValue, monthsSinceLastDefaulted: Int
  let hasEverDefaulted: Bool
  let monthsSinceLastDelinquent: Int
  let hasEverBeenDelinquent: Bool
  let percentageCreditUsed, percentageCreditUsedDirectionFlag, changedScore, currentShortTermDebt: Int
  let currentShortTermNonPromotionalDebt, currentShortTermCreditLimit, currentShortTermCreditUtilisation, changeInShortTermDebt: Int
  let currentLongTermDebt, currentLongTermNonPromotionalDebt: Int
  let changeInLongTermDebt, numPositiveScoreFactors, numNegativeScoreFactors, equifaxScoreBand: Int
  let equifaxScoreBandDescription: String
  let daysUntilNextReport: Int
}
