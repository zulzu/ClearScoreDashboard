//
//  ScoreDashboardVC.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 23/11/2021.
//

import UIKit

class ScoreDashboardVC: UIViewController {
  
  private let scoreDashboardView = ScoreDashboardView()
  
  var viewModel = ScoreDashboardVM()
  //  var creditReport : CreditReportInfo?
  
  override func loadView() {
    view = scoreDashboardView
    scoreDashboardView.creditScoreTappedHandler = handleCreditScoreButtonTap(_:)
    navigationItem.title = "Dashboard"
    viewModel.fetchCreditReportInfo()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    updateNavbar()
  }
  
  //=======================================
  // MARK: Private Methods
  //=======================================  
  private func updateNavbar() {
    let backButton = UIBarButtonItem()
    backButton.title = "Back"
    backButton.tintColor = .white
    navigationItem.backBarButtonItem = backButton
  }
  
  private func handleCreditScoreButtonTap(_ customView: ScoreDashboardView) {
    let scoreDetailsVC = ScoreDetailsVC()
    self.navigationController?.pushViewController(scoreDetailsVC, animated: true)
  }
}
