//
//  ExperienceDetailSummaryCellTest.swift
//  CVChallengeTests
//
//  Created by Isela Leticia Soto Galindo on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest
@testable import CVChallenge

class MockExperienceDetailSummaryCell: UITableViewCell, ExperienceDetailSummaryCellProtocol {
    
    func fill(with summary: String) {
        textLabel?.text = summary
    }
}

class ExperienceDetailSummaryCellTest: XCTestCase {
    var model: ExperienceDetailSummaryCellModel?
    
    override func setUp() {
        super.setUp()
        model = ExperienceDetailSummaryCellModel(summary: "Description of the job activities")
    }
    
    override func tearDown() {
        super.tearDown()
        model = nil
    }
    
    func testExperienceDetailSummaryCellFillWithModel(){
        let cell = MockExperienceDetailSummaryCell()
        model?.drawCell(cell)
        
        XCTAssertEqual(cell.textLabel?.text, model?.summary)
    }
    
}
