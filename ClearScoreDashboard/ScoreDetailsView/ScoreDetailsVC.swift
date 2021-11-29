//
//  ScoreDetailsVC.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 29/11/2021.
//

import UIKit

class ScoreDetailsVC: UIViewController {
    
  private let scoreDetailsView = ScoreDetailsView()

//  var viewModel = ScoreDashboardVM()
//  var creditReport : CreditReportInfo?
  
  override func loadView() {
    view = scoreDetailsView
    updateNavbar()
  }
  
  //=======================================
  // MARK: Private Methods
  //=======================================
  private func updateNavbar() {
    navigationItem.title = "Details"
  }
}
