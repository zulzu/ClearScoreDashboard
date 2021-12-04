//
//  ScoreDetailsVM.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 01/12/2021.
//

import Foundation

class ScoreDetailsVM {
  
  typealias Work = () -> Void
  typealias Executor = (@escaping Work) -> Void
  
  //------------------------------------
  // MARK: Properties
  //------------------------------------
  // # Private/Fileprivate
  private let mainExecutor: Executor
  private let creditReport : CreditReportInfo

  // # Public/Internal/Open
  lazy var currentShortTermDebt = {
    "Current short term debt: " + "\(String(describing: self.creditReport.currentShortTermDebt))"
  }
  lazy var currentShortTermCreditLimit = {
    "Current long term debt: " + "\(String(describing: self.creditReport.currentShortTermCreditLimit))"
  }
  lazy var currentLongTermDebt = {
    "Current long term debt: " + "\(String(describing: self.creditReport.currentLongTermDebt))"
  }
  lazy var percentageCreditUsed = {
    "Percentage credit used: " + "\(String(describing: self.creditReport.percentageCreditUsed))"
  }
  lazy var daysUntilNextReport = {
    "Days until next report: " + "\(String(describing: self.creditReport.daysUntilNextReport))"
  }
  
  //=======================================
  // MARK: Public Methods
  //=======================================
  init(mainExecutor: @escaping Executor = { work in DispatchQueue.main.async { work() } },
       creditReport: CreditReportInfo) {
    self.mainExecutor = mainExecutor
    self.creditReport = creditReport
  }
}
