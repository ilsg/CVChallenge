//
//  ExperienceDetailHeaderCellTest.swift
//  CVChallengeTests
//
//  Created by Isela Leticia Soto Galindo on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest
@testable import CVChallenge

class MockExperienceDetailHeaderCell: UITableViewCell, ExperienceDetailHeaderCellProtocol {
    fileprivate var imageData: Data?
    fileprivate var company: String?

    func fill(with title: String?, and imageData: Data?) {
        self.imageData = imageData
        self.company = title
    }
}

class ExperienceDetailHeaderCellTest: XCTestCase {
    var model: ExperienceDetailHeaderCellModel?
    
    override func setUp() {
        super.setUp()
        let mockData = Data(base64Encoded: "image.png")
        model = ExperienceDetailHeaderCellModel(company: "X company", imageData: mockData)
    }

    override func tearDown() {
        super.tearDown()
        model = nil
    }
    
    func testExperienceDetailHeaderCellFillsWithModel(){
        let cell = MockExperienceDetailHeaderCell()
        model?.drawCell(cell)
        
        XCTAssertEqual(cell.imageData, model?.imageData)
        XCTAssertEqual(cell.company, model?.company)
    }


}
