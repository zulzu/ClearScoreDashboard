//
//  ClearScoreDashboardNavigationController.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 23/11/2021.
//

import UIKit

class ClearScoreDashboardNavigationController: UINavigationController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    navigationBar.barStyle = .black
    navigationBar.isTranslucent = false
    navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
}
