//
//  ExperienceTest.swift
//  CVChallengeTests
//
//  Created by Isela Leticia Soto Galindo on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest
@testable import CVChallenge

class ExperienceTest: XCTestCase {

    func testExperienceEntityImplementsCodable(){
        let jsonString = """
                            { "company" : "X Company",
                            "position" : "X position",
                            "years" : "2001 - 2004",
                            "description"  : "A more detail description",
                            "logo": "https://www.resources.com/app/image.png"
                            }
                        """
        guard let jsonData = jsonString.data(using: .utf8), let model = try? JSONDecoder().decode(Experience.self, from: jsonData) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(model.company, "X Company")
        XCTAssertEqual(model.position, "X position")
        XCTAssertEqual(model.years, "2001 - 2004")
        XCTAssertEqual(model.description, "A more detail description")
        XCTAssertEqual(model.imageUrl, "https://www.resources.com/app/image.png")
    }

}
