//
//  ExperienceService.swift
//  CVChallenge
//
//  Created by isela on 6/17/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

protocol ExperienceServiceProtocol {
  func fetchExperienceList(for path: String, with callback: @escaping (ServiceResult<[Experience]>)-> Void)
}

class ExperienceService: ExperienceServiceProtocol {
    typealias Result = (ServiceResult<[Experience]>)
    private let networking = NetworkAPI()

    /// Calls the NetworkAPI jsonRequest
    ///
    /// - Parameter callback: Callback for the response of the service of type Array<Experience>
    func fetchExperienceList(for path: String, with callback: @escaping (Result)-> Void){
        let url = String(format: API.baseURL, path)
        networking.jsonRequest(url: url) { (response: Result) in
            callback(response)
        }
    }
}
