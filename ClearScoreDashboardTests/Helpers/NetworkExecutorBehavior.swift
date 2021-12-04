//
//  NetworkExecutorBehavior.swift
//  ClearScoreDashboardTests
//
//  Created by Andras Pal on 04/12/2021.
//

import XCTest
@testable import ClearScoreDashboard

enum NetworkExecutorBehavior {
  
  case invalidStatusCode
  case nonDecodableData
  case emptyResponse
  case emptyData
  case mockDataReceived
}
