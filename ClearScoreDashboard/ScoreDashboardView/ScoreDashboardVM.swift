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
  private let networkProvider: Network
  private let mainExecutor: Executor
  
  // # Public/Internal/Open
  var creditReport: CreditReportInfo?
  
  //=======================================
  // MARK: Public Methods
  //=======================================
  init(networkProvider: Network = NetworkProvider(),
       mainExecutor: @escaping Executor = { work in DispatchQueue.main.async { work() } }) {
    self.networkProvider = networkProvider
    self.mainExecutor = mainExecutor
  }
  
  func fetchCreditReportInfo() {
    networkProvider.fetchCreditReport() { (result) in
      switch result {
      case let .failure(error):
        print (error)
      case let .success(creditReport):
        self.mainExecutor {
          self.creditReport = creditReport
        }
      }
    }
  }
}

