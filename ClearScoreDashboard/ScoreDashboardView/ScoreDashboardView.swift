//
//  ScoreDashboardView.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 23/11/2021.
//

import UIKit

class ScoreDashboardView: UIView {
  
  //------------------------------------
  // MARK: Properties
  //------------------------------------
  // # Private/Fileprivate
  private let bgView: UIView = {
    let bgView = UIView()
    bgView.backgroundColor = .black
    bgView.translatesAutoresizingMaskIntoConstraints = false
    return bgView
  }()
  
  private let title: UILabel = {
    let title = UILabel()
    title.font = UIFont.systemFont(ofSize: 16)
    title.text = "Dashboard Test"
    title.textColor = .white
    title.numberOfLines = 0
    title.textAlignment = .left
    title.translatesAutoresizingMaskIntoConstraints = false
    return title
  }()
  
  //=======================================
  // MARK: Public Methods
  //=======================================
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //=======================================
  // MARK: Private Methods
  //=======================================
  private func setupView() {
    backgroundColor = .black
    addSubview(bgView)
    addSubview(title)
    setupConstraints()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      bgView.topAnchor.constraint(equalTo: self.topAnchor),
      bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
      title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
      title.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
    ])
  }
}
