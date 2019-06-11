//
//  ExperienceListCellTest.swift
//  CVChallengeTests
//
//  Created by Isela Leticia Soto Galindo on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest
@testable import CVChallenge

class MockExperienceListCell: UITableViewCell, ExperienceListCellProtocol {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(with model: Experience) {
        textLabel?.text = model.company
        detailTextLabel?.text = model.years
    }
}

class ExperienceListCellTest: XCTestCase {
    var cellModel: ExperienceListCellModel?
    
    override func setUp() {
        super.setUp()
        cellModel = ExperienceListCellModel(model: Experience(company: "X Company", position: "X Position", years: "2001 - 2004", description: "Description of the role", imageUrl: "https://www.resources.com/app/image.png", imageData: nil))
    }
    
    override func tearDown() {
        super.tearDown()
        cellModel = nil
    }
    
    func testExperienceListCellFillWithModel(){
        let cell = MockExperienceListCell()
        cellModel?.drawCell(cell)
        XCTAssertEqual(cell.textLabel?.text, cellModel?.model.company)
        XCTAssertEqual(cell.detailTextLabel?.text, cellModel?.model.years)
    }
}
