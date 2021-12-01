//
//  ScoreDashboardVC.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 23/11/2021.
//

import UIKit

class ScoreDashboardVC: UIViewController {
  
  private let scoreDashboardView = ScoreDashboardView()
  
  lazy var viewModel = ScoreDashboardVM(
    creditRepDidUpdate: { [weak self] in
      self?.checkCreditReport()
    })
  
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
    guard let creditReport = viewModel.creditReport else {
      return
    }
    let scoreDetailsVM = ScoreDetailsVM(creditReport: creditReport)
    let scoreDetailsVC = ScoreDetailsVC(viewModel: scoreDetailsVM)
    self.navigationController?.pushViewController(scoreDetailsVC, animated: true)
  }
  
  private func checkCreditReport() {
    viewModel.creditReport == nil ? print("couldn't retrive the credit report") : print("credit report: \(String(describing: viewModel.creditReport))")
    self.scoreDashboardView.circularButton.setTitle(viewModel.buttonTitle(), for: .normal)
  }
}
