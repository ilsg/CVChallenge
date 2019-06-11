//
//  ExperienceListUITests.swift
//  CVChallengeUITests
//
//  Created by isela on 6/19/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest

class ExperienceListUITests: XCTestCase {

    var experienceListScreen: ExperienceListScreen!
    var helper: HelperUITest!
    
    override func setUp() {
        super.setUp()
        experienceListScreen = ExperienceListScreen()
        helper = HelperUITest()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
        experienceListScreen = nil
        helper = nil
    }

    func testExperienceListShowsCorrectTitle() {
        let identifier = helper.localizedString(ScreenTitle.experienceListView.rawValue)
        let title = experienceListScreen.hasTitle(with: identifier)
        XCTAssertTrue(title.exists)
    }

    func testExperienceListShowCorrectInfo() {
        let cell = experienceListScreen.cell(at: 0)
        XCTAssertTrue(cell.exists)
        
        let title = experienceListScreen.getTitleElement(for: cell)
        let subtitle = experienceListScreen.getSubTitleElement(for: cell)
        XCTAssertTrue(title.exists)
        XCTAssertTrue(subtitle.exists)
        XCTAssertEqual(title.label,"BS in Information Technology (Database Emphasis)")
        XCTAssertEqual(subtitle.label, "2001 - 2004")
    }
    
    class ExperienceListScreen {
        func getTitleElement(for cell: XCUIElement)-> XCUIElement {
            let element = cell.staticTexts[AccessibilityIdentifiers.experienceListCellTitleLabel.rawValue].firstMatch
            return element
        }
        
        func getSubTitleElement(for cell: XCUIElement)-> XCUIElement {
            let element = cell.staticTexts[AccessibilityIdentifiers.experienceListCellSubtitleLabel.rawValue].firstMatch
            return element
        }
        
        func cell(at index: Int = 0) -> XCUIElement {
            let table = XCUIApplication().tables.matching(identifier: AccessibilityIdentifiers.experienceListTableView.rawValue)
            let cell = table.element(boundBy: index)
            return cell
        }
        
        func elementFor(cell: XCUIElement, with identifier: String) -> XCUIElement {
            let element = cell.children(matching: .staticText).matching(identifier: identifier).firstMatch
            return element
        }
        
        func hasTitle(with identifier: String) -> XCUIElement {
            return XCUIApplication().navigationBars.matching(identifier: identifier).firstMatch
        }
    }
}
