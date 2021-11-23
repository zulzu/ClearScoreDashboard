//
//  ClearScoreData.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 22/11/2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let clearScore = try? newJSONDecoder().decode(ClearScore.self, from: jsonData)

import Foundation

// MARK: - ClearScore
struct ClearScoreData: Codable {
  let accountIDVStatus: String
  let creditReportInfo: CreditReportInfo
  let dashboardStatus, personaType: String
  let coachingSummary: CoachingSummary
  let augmentedCreditScore: JSONNull?
}

// MARK: - CoachingSummary
struct CoachingSummary: Codable {
  let activeTodo, activeChat: Bool
  let numberOfTodoItems, numberOfCompletedTodoItems: Int
  let selected: Bool
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
  let currentLongTermCreditLimit, currentLongTermCreditUtilisation: JSONNull?
  let changeInLongTermDebt, numPositiveScoreFactors, numNegativeScoreFactors, equifaxScoreBand: Int
  let equifaxScoreBandDescription: String
  let daysUntilNextReport: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
  
  public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
    return true
  }
  
  public var hashValue: Int {
    return 0
  }
  
  public func hash(into hasher: inout Hasher) {
    // No-op
  }
  
  public init() {}
  
  public required init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if !container.decodeNil() {
      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encodeNil()
  }
}
