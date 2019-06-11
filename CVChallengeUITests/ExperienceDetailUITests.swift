//
//  ExperienceDetailUITests.swift
//  CVChallengeUITests
//
//  Created by isela on 6/20/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest

class ExperienceDetailUITests: XCTestCase {

    var experienceDetailScreen: ExperienceDetailScreen!
    var helper: HelperUITest!
    
    override func setUp() {
        super.setUp()
        experienceDetailScreen = ExperienceDetailScreen()
        helper = HelperUITest()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
        experienceDetailScreen = nil
        helper = nil
    }
    
    func testExperienceDetailShowsCorrectTitle() {
        experienceDetailScreen.showDetailPage()
        let identifier = helper.localizedString(ScreenTitle.detailView.rawValue)
        let title = experienceDetailScreen.hasTitle(with: identifier)
        XCTAssertTrue(title.exists)
    }
    
    func testExperienceDetailShowHeaderCell() {
        experienceDetailScreen.showDetailPage()

        let cell = experienceDetailScreen.cell(at: 0)
        XCTAssertTrue(cell.exists)
        let title = experienceDetailScreen.elementFor(cell: cell, with: AccessibilityIdentifiers.experienceDetailHeaderCellLabel.rawValue)
        XCTAssertTrue(title.exists)
        XCTAssertEqual(title.label,"BS in Information Technology (Database Emphasis)")
    }
    
    func testExperienceDetailShowPositionCell() {
        experienceDetailScreen.showDetailPage()
        let cell = experienceDetailScreen.cell(at: 1)
        XCTAssertTrue(cell.exists)
        
        let position = experienceDetailScreen.elementFor(cell: cell, with: AccessibilityIdentifiers.experienceDetailPositionCellTitleLabel.rawValue)
        let years = experienceDetailScreen.elementFor(cell: cell, with: AccessibilityIdentifiers.experienceDetailPositionCellSubtitleLabel.rawValue)
        XCTAssertTrue(position.exists)
        XCTAssertTrue(years.exists)
        XCTAssertEqual(position.label, "Intern / Programmer")
        XCTAssertEqual(years.label,"2001 - 2004")
    }
    
    func testExperienceDetailShowSummaryCell() {
        experienceDetailScreen.showDetailPage()
        let cell = experienceDetailScreen.cell(at: 2)
        XCTAssertTrue(cell.exists)
        
        let summary = experienceDetailScreen.elementFor(cell: cell, with: AccessibilityIdentifiers.experienceDetailSummaryCellLabel.rawValue)
        XCTAssertTrue(summary.exists)
        let textSummary = "Hired as a full-time programmer following commended performance in initial intern role. Enhanced DEF Bank reporting subsystem that provided new functionality to reporting functions that were previously unavailable."
        XCTAssertEqual(summary.label, textSummary)
    }
    
    class ExperienceDetailScreen {
        func cell(at index: Int = 0) -> XCUIElement {
            let table = XCUIApplication().tables.matching(identifier: AccessibilityIdentifiers.experienceDetailTableView.rawValue)
            let cell = table.cells.element(boundBy: index)
            return cell
        }
        
        func elementFor(cell: XCUIElement, with identifier: String) -> XCUIElement {
            let element = cell.children(matching: .staticText).matching(identifier: identifier).firstMatch
            return element
        }
        
        func hasTitle(with identifier: String) -> XCUIElement {
            return XCUIApplication().navigationBars.matching(identifier: identifier).firstMatch
        }
        
        func showDetailPage() {
            let table = XCUIApplication().tables.matching(identifier: AccessibilityIdentifiers.experienceListTableView.rawValue)
            table.cells.element(boundBy: 0).tap()
        }
    }
}
