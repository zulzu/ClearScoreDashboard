//
//  ScoreDashboardVC.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 23/11/2021.
//

import UIKit

class ScoreDashboardVC: UIViewController {
  
  typealias Work = () -> Void
  typealias Executor = (@escaping Work) -> Void
  
  private let scoreDashboardView = ScoreDashboardView()
  private let networkProvider: Network
  private let mainExecutor: Executor
  
  var productData : ClearScoreData?
  
  init(networkProvider: Network = NetworkProvider(),
       mainExecutor: @escaping Executor = { work in DispatchQueue.main.async { work() } }) {
    self.networkProvider = networkProvider
    self.mainExecutor = mainExecutor
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func fetchCreditReportInfo() {
    networkProvider.fetchCreditReport() { (result) in
      switch result {
      case let .failure(error):
        print (error)
      case let .success(creditReport):
        self.mainExecutor {
          self.productData = creditReport
        }
      }
    }
  }
  
  override func loadView() {
    view = scoreDashboardView
    fetchCreditReportInfo()
  }
}
