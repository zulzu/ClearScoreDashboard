//
//  CreditScoreButton.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 02/12/2021.
//

import UIKit

class CreditScoreCircularView: UIView {
  
  //------------------------------------
  // MARK: Properties
  //------------------------------------
  // # Private/Fileprivate
  private let bgView: UIView = {
    let bgView = UIView()
    bgView.backgroundColor = .white
    bgView.translatesAutoresizingMaskIntoConstraints = false
    bgView.layer.cornerRadius = (UIScreen.screenWidth - UI.Padding.XLPadding) / 2
    bgView.layer.borderWidth = 1
    bgView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
    return bgView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Your credit score is"
    label.textColor = .black
    return label
  }()
    
  private let subtitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "out of 700"
    label.textColor = .black
    return label
  }()
  
  // # Public/Internal/Open
  let creditScoreLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.font = UIFont.systemFont(ofSize: UI.Size.largeFont, weight: .thin)
    label.textColor = .black
    return label
  }()

  //=======================================
  // MARK: Public Methods
  //=======================================
  required init() {
    super.init(frame: .zero)
    setupView()
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //=======================================
  // MARK: Private Methods
  //=======================================
  private func setupView() {
    backgroundColor = .white
    addSubview(bgView)
    bgView.addSubview(titleLabel)
    bgView.addSubview(creditScoreLabel)
    bgView.addSubview(subtitleLabel)
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
      creditScoreLabel.heightAnchor.constraint(equalToConstant: UI.Size.creditScoreSize),
      creditScoreLabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
      creditScoreLabel.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
    ])
    
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: creditScoreLabel.centerXAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: creditScoreLabel.topAnchor, constant: -UI.Padding.defaultPadding),
    ])
    
    NSLayoutConstraint.activate([
      subtitleLabel.centerXAnchor.constraint(equalTo: creditScoreLabel.centerXAnchor),
      subtitleLabel.topAnchor.constraint(equalTo: creditScoreLabel.bottomAnchor, constant: UI.Padding.defaultPadding),
    ])
  }
}
