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
  
  private let bgImage: UIImageView = {
    let bgImage = UIImageView(frame: .zero)
    bgImage.image = UIImage(named: "dashboardBG")
    bgImage.translatesAutoresizingMaskIntoConstraints = false
    bgImage.contentMode = .scaleAspectFill
    return bgImage
  }()
    
  // # Public/Internal/Open
  let circularButton = CreditScoreCircularView()
  var creditScoreTappedHandler: ((ScoreDashboardView)->Void)?
  
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
  
  @objc func circularButtonTap(_ sender: UITapGestureRecognizer? = nil) {
    self.creditScoreTappedHandler?(self)
  }
  
  //=======================================
  // MARK: Private Methods
  //=======================================
  private func setupView() {
    let creditScoreGestureRec = UITapGestureRecognizer(target: self, action: #selector(circularButtonTap(_:)))
    addSubview(bgView)
    bgView.insertSubview(bgImage, at: 0)
    addSubview(circularButton)
    circularButton.translatesAutoresizingMaskIntoConstraints = false
    circularButton.layer.cornerRadius = (UIScreen.screenWidth - UI.Padding.XLPadding) / 2
    circularButton.addGestureRecognizer(creditScoreGestureRec)
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
      circularButton.widthAnchor.constraint(equalToConstant: UIScreen.screenWidth - UI.Padding.XLPadding),
      circularButton.heightAnchor.constraint(equalToConstant: UIScreen.screenWidth - UI.Padding.XLPadding),
      circularButton.centerXAnchor.constraint(equalTo: self.bgView.centerXAnchor),
      circularButton.centerYAnchor.constraint(equalTo: self.bgView.centerYAnchor),
    ])
    
    NSLayoutConstraint.activate([
      bgImage.topAnchor.constraint(equalTo: bgView.topAnchor),
      bgImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
      bgImage.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
      bgView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor)
    ])
  }
}
