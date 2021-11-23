//
//  NetworkExecutor.swift
//  ClearScoreDashboard
//
//  Created by Andras Pal on 22/11/2021.
//

import Foundation

protocol NetworkExecutor {
  
  func executeRequest(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}
