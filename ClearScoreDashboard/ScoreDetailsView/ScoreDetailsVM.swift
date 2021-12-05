//
//  ScoreDetailsVM.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 01/12/2021.
//

import Foundation

class ScoreDetailsVM {
  
  //------------------------------------
  // MARK: Properties
  //------------------------------------
  // # Private/Fileprivate
  private let creditReport : CreditReportInfo
  
  // # Public/Internal/Open
  lazy var currentShortTermDebt = {
    "Current short term debt: " + "\(self.creditReport.currentShortTermDebt ?? 0)"
  }
  lazy var currentShortTermCreditLimit = {
    "Current long term debt: " + "\(self.creditReport.currentShortTermCreditLimit ?? 0)"
  }
  lazy var currentLongTermDebt = {
    "Current long term debt: " + "\(self.creditReport.currentLongTermDebt ?? 0)"
  }
  lazy var percentageCreditUsed = {
    "Percentage credit used: " + "\(self.creditReport.percentageCreditUsed ?? 0)"
  }
  lazy var daysUntilNextReport = {
    "Days until next report: " + "\(self.creditReport.daysUntilNextReport ?? 0)"
  }
  
  //=======================================
  // MARK: Public Methods
  //=======================================
  init(creditReport: CreditReportInfo) {
    self.creditReport = creditReport
  }
}
