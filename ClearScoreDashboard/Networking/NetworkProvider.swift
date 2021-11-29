//
//  NetworkProvider.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 22/11/2021.
//

import Foundation

class NetworkProvider: Network {
  
  //------------------------------------
  // MARK: Properties
  //------------------------------------
  // # Private/Fileprivate
  private let clearScoreURL = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
  private let requestExecutor: NetworkExecutor
  
  //=======================================
  // MARK: Public Methods
  //=======================================
  init(requestExecutor: NetworkExecutor = URLSession.shared) {
    self.requestExecutor = requestExecutor
  }
  
  /// Getting the credit report from the ClearScore backend
  /// - Parameter completion: the callback called after retrieval
  func fetchCreditReport(
    completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void
  ) {
    guard let url = URL(string: clearScoreURL) else {
      completion(.failure(.missingUrl))
      return
    }
    requestExecutor.executeRequest(with: url) { [weak self] data, response, error in
      self?.handleResponse(data: data, response: response, error: error, completion: completion)
    }
  }
  
  //=======================================
  // MARK: Private Methods
  //=======================================
  // Extract completion handling
  private func handleResponse(
    data: Data?,
    response: URLResponse?,
    error: Error?,
    completion: @escaping (Result<CreditReportInfo, NetworkError>) -> Void
  ) {
    if let error = error {
      completion(.failure(.apiError(error)))
    }
    guard
      let data = data,
      let response = response as? HTTPURLResponse,
      200...299 ~= response.statusCode
    else {
      completion(.failure(.invalidResponse))
      return
    }
    do {
      let serverResponse = try JSONDecoder().decode(ClearScoreData.self, from: data)
      completion(.success(serverResponse.creditReportInfo))
    }
    catch let unsuccessfulQuery {
      completion(.failure(.other(unsuccessfulQuery)))
    }
  }
}
