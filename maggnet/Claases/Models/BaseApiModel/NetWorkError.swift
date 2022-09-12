//
//  NetWorkError.swift
//  maggnet
//
//  Created by Deepak on 12/09/22.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var message: String
}
