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
    
  private let circularButtonTap = UITapGestureRecognizer(target: self, action: #selector(circularButtonTap(_:)))
  
  let circularButton: UIView = {
    
    let label1: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Your credit score is"
      label.textColor = .black
      return label
    }()
    
    let label2: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "555"
      label.textColor = .black
      return label
    }()
    
    let label3: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "out of 700"
      label.textColor = .black
      return label
    }()
    
    let bgView = UIView()
    bgView.backgroundColor = .white.withAlphaComponent(0.7)
    bgView.translatesAutoresizingMaskIntoConstraints = false
    bgView.layer.cornerRadius = (UIScreen.screenWidth - UI.Padding.XLPadding) / 2
    bgView.addSubview(label1)
    bgView.addSubview(label2)
    bgView.addSubview(label3)
    
    NSLayoutConstraint.activate([
      label2.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
      label2.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
    ])
    
    NSLayoutConstraint.activate([
      label1.centerXAnchor.constraint(equalTo: label2.centerXAnchor),
      label1.bottomAnchor.constraint(equalTo: label2.topAnchor, constant: -UI.Padding.defaultPadding),
    ])
    
    NSLayoutConstraint.activate([
      label3.centerXAnchor.constraint(equalTo: label2.centerXAnchor),
      label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: UI.Padding.defaultPadding),
    ])
    
    return bgView
  }()
  
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
    backgroundColor = .black
    addSubview(bgView)
    bgView.insertSubview(bgImage, at: 0)
    addSubview(circularButton)
    circularButton.addGestureRecognizer(circularButtonTap)
    circularButton.isUserInteractionEnabled = true
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
