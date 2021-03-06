//
//  ScoreDashboardVM.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 23/11/2021.
//

import Foundation

class ScoreDashboardVM {
  
  typealias Work = () -> Void
  typealias Executor = (@escaping Work) -> Void
  
  //------------------------------------
  // MARK: Properties
  //------------------------------------
  // # Private/Fileprivate
  private let networkProvider: CreditReportService
  private let mainExecutor: Executor
  
  // # Public/Internal/Open
  var creditReport: CreditReportInfo? {
    didSet {
      self.creditReportDidUpdate()
    }
  }
  let creditReportDidUpdate: () -> ()
  lazy var creditScore = {
    self.creditReport?.score ?? 0
  }
  var netErr: NetworkError? {
    didSet {
      self.creditReportDidUpdate()
    }
  }
  
  //=======================================
  // MARK: Public Methods
  //=======================================
  init(networkProvider: CreditReportService = NetworkProvider(),
       mainExecutor: @escaping Executor = { work in DispatchQueue.main.async { work() } },
       creditRepDidUpdate: @escaping ()->()) {
    self.networkProvider = networkProvider
    self.mainExecutor = mainExecutor
    self.creditReportDidUpdate = creditRepDidUpdate
  }
  
  func fetchCreditReportInfo() {
    networkProvider.fetchCreditReport() { (result) in
      switch result {
      case let .failure(error):
        self.mainExecutor {
          self.netErr = error
        }
      case let .success(creditReport):
        self.mainExecutor {
          self.creditReport = creditReport
        }
      }
    }
  }
}

