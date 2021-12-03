//
//  UIViewController.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 03/12/2021.
//

import UIKit

extension UIViewController {
  
  /// A simple alert with an OK button
  /// - Parameters:
  ///   - title: The title of the alert
  ///   - message: The message of the alert
  func presentAlert(title: String, message: String) {
    let alerController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .destructive) { _ in }
    alerController.addAction(okAction)
    self.present(alerController, animated: true, completion: nil)
  }
}
