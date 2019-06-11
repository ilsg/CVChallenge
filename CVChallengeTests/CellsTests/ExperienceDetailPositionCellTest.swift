//
//  ExperienceDetailPositionCellTest.swift
//  CVChallengeTests
//
//  Created by Isela Leticia Soto Galindo on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest
@testable import CVChallenge

class MockExperienceDetailPositionCell: UITableViewCell, ExperienceDetailPositionCellProtocol {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(with position: String, and years: String) {
        textLabel?.text = position
        detailTextLabel?.text = years
    }
}

class ExperienceDetailPositionCellTest: XCTestCase {
    var model: ExperienceDetailPositionCellModel?
    
    override func setUp() {
        super.setUp()
        model = ExperienceDetailPositionCellModel(position: "Developer", years: "2001 - 2004")
    }
    
    override func tearDown() {
        super.tearDown()
        model = nil
    }
    
    func testExperienceDetailPositionCellFillWithModel(){
        let cell = MockExperienceDetailPositionCell()
        model?.drawCell(cell)
        
        XCTAssertEqual(cell.textLabel?.text, model?.position)
        XCTAssertEqual(cell.detailTextLabel?.text, model?.years)
    }
    
}
