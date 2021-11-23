//
//  Network.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 22/11/2021.
//

import Foundation

protocol Network {
  
  func fetchCreditReport(completion: @escaping (Result<ClearScoreData, NetworkError>) -> Void)
}
