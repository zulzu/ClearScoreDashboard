//
//  CreditReportService.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 22/11/2021.
//

import Foundation

protocol CreditReportService {
  
  func fetchCreditReport(completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void)
}
