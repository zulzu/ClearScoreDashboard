//
//  ScoreDetailsView.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 29/11/2021.
//

import UIKit

class ScoreDetailsView: UIView {
  
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
  
  private let bgImage: UIImageView = {
    let bgImage = UIImageView(frame: .zero)
    bgImage.image = UIImage(named: "detailsBG")
    bgImage.translatesAutoresizingMaskIntoConstraints = false
    bgImage.contentMode = .scaleAspectFill
    return bgImage
  }()
  
  let currentShortTermDebtLabel: UILabel = {
    let title = UILabel()
    title.font = UIFont.systemFont(ofSize: 16)
    title.text = ""
    title.textColor = .black
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
    bgView.insertSubview(bgImage, at: 0)
    addSubview(currentShortTermDebtLabel)
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
      bgImage.topAnchor.constraint(equalTo: bgView.topAnchor),
      bgImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
      bgImage.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
      bgView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      currentShortTermDebtLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
      currentShortTermDebtLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
      currentShortTermDebtLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
    ])
  }
}
