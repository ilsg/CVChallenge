//
//  MockNeworkAPI.swift
//  CVChallengeTests
//
//  Created by isela on 6/12/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation
import XCTest
@testable import CVChallenge

class MockNeworkAPI: ExperienceService {
    var result: (ServiceResult<[Experience]>)?
    override func fetchExperienceList(for path: String, with callback: @escaping (ExperienceService.Result) -> Void) {
        guard let result = result else {
            XCTFail("Not fake result was provided")
            return
        }
        callback(result)
    }
}

struct StubNetworkAPIResult {
    static let errorConnectionResult = ServiceResult<[Experience]>.error(.notNetworkConnection)
    static let errorNotFoundResult = ServiceResult<[Experience]>.error(.resourceNotFound)
    static let errorDataResult = ServiceResult<[Experience]>.error(.dataError)
    static let successResult = ServiceResult<[Experience]>.success(StubNetworkAPIResult.data)
    static let successEmpyResult = ServiceResult<[Experience]>.success(emptyData)
    static let data = [
        Experience(company: "Company 1", position: "Position 1", years: "2001", description: "Job description", imageUrl: "http://fake.server/image.png", imageData: nil),
        Experience(company: "Company 2", position: "Position 2", years: "2004", description: "Job description", imageUrl: "http://fake.server/image.png", imageData: nil)
    ]
    static let emptyData = Array<Experience>()
}

