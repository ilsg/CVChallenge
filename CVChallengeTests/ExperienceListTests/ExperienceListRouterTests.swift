//
//  ExperienceListRouterTests.swift
//  CVChallengeTests
//
//  Created by isela on 6/12/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest
@testable import CVChallenge

class ExperienceListRouterTests: XCTestCase {
    
    var sut : ExperienceListRouter!
    
    override func setUp() {
        sut = ExperienceListRouter()
    }

    override func tearDown() {
        sut = nil
    }

    func testShowExperienceDetail() {
        sut.showExperienceDetail(with: Experience(company: "X Company", position: "X Position", years: "2001 - 2004", description: "Description of the role", imageUrl: "https://www.resources.com/app/image.png", imageData: nil))
        XCTAssertTrue(sut.topNavController?.topViewController is ExperienceDetailView)
    }
}
