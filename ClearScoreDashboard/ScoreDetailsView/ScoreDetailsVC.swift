//
//  ScoreDetailsVC.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 29/11/2021.
//

import UIKit

class ScoreDetailsVC: UIViewController {
    
  private let scoreDetailsView = ScoreDetailsView()
  private let viewModel: ScoreDetailsVM
  
  override func loadView() {
    view = scoreDetailsView
    updateNavbar()
    scoreDetailsView.currentShortTermDebtLabel.text = viewModel.currentShortTermDebt()
    scoreDetailsView.currentShortTermCreditLimitLabel.text = viewModel.currentShortTermCreditLimit()
    scoreDetailsView.currentLongTermDebtLabel.text = viewModel.currentLongTermDebt()
    scoreDetailsView.percentageCreditUsedLabel.text = viewModel.percentageCreditUsed()
    scoreDetailsView.daysUntilNextReportLabel.text = viewModel.daysUntilNextReport()
  }
  
  //=======================================
  // MARK: Public Methods
  //=======================================
  init(viewModel: ScoreDetailsVM) {
    self.viewModel = viewModel
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
