//
//  ScoreDetailsVC.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 29/11/2021.
//

import UIKit

class ScoreDetailsVC: UIViewController {
    
  private let scoreDetailsView = ScoreDetailsView()

  private let creditReport : CreditReportInfo
  
  override func loadView() {
    view = scoreDetailsView
    updateNavbar()
    scoreDetailsView.currentShortTermDebtLabel.text = "Current short term debt: \(creditReport.currentShortTermDebt)"
  }
  
  //=======================================
  // MARK: Public Methods
  //=======================================
  init(creditReport: CreditReportInfo) {
    self.creditReport = creditReport
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //=======================================
  // MARK: Private Methods
  //=======================================
  private func updateNavbar() {
    navigationItem.title = "Details"
  }
}
