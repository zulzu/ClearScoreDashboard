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
    viewModel.fetchCreditReportInfo()
  }
}
