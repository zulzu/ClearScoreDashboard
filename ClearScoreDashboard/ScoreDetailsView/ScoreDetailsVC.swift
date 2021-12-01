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
    scoreDetailsView.currentShortTermCreditLimitLabel.text = "Current short term credit limit: \(creditReport.currentShortTermCreditLimit)"
    scoreDetailsView.currentLongTermDebtLabel.text = "Current long term debt: \(creditReport.currentLongTermDebt)"
    scoreDetailsView.percentageCreditUsedLabel.text = "Percentage credit used: \(creditReport.percentageCreditUsed)"
    scoreDetailsView.daysUntilNextReportLabel.text = "Days until next report: \(creditReport.daysUntilNextReport)"
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
