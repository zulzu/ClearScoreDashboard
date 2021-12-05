//
//  ScoreDashboardVC.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 23/11/2021.
//

import UIKit

class ScoreDashboardVC: UIViewController {
  
  private let scoreDashboardView = ScoreDashboardView()
  private let shapeLayer = CAShapeLayer()
  
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
    self.scoreDashboardView.circularButton.creditScoreLabel.text = "\(viewModel.creditScore())"
    addCircularProggressBar()
    animateProggressBar()
    guard let error = viewModel.netErr else { return }
    self.presentAlert(title: "Error", message: "\(error.locolizedDescription)")
  }
  
  private func addCircularProggressBar() {
    let circularPath = UIBezierPath(
      arcCenter: scoreDashboardView.circularButton.creditScoreLabel.center,
      radius: (UIScreen.main.bounds.width - UI.Padding.XLPadding) / 2 - 10,
      startAngle: -.pi / 2,
      endAngle: .pi * 1.5,
      clockwise: true
    )
    shapeLayer.path = circularPath.cgPath
    shapeLayer.lineWidth = 3
    shapeLayer.strokeColor = UIColor.systemTeal.cgColor
    shapeLayer.fillMode = .forwards
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeEnd = 0
    shapeLayer.lineCap = .round
    scoreDashboardView.circularButton.layer.addSublayer(shapeLayer)
  }
  
  private func animateProggressBar() {
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    let scorePercentage = Double(viewModel.creditScore()) / Double(viewModel.creditReport?.maxScoreValue ?? 700)
    basicAnimation.toValue = scorePercentage
    basicAnimation.duration = 1
    basicAnimation.fillMode = .forwards
    basicAnimation.isRemovedOnCompletion = false
    shapeLayer.add(basicAnimation, forKey: "basic")
  }
}
