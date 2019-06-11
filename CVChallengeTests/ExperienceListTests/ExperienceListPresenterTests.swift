//
//  ExperienceListPresenterTests.swift
//  CVChallengeTests
//
//  Created by isela on 6/12/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest
@testable import CVChallenge

class ExperienceListPresenterTests: XCTestCase {

    class MockExperienceListInteractor: ExperienceListInteractor {
        var fetchDataCalled = false

        override func fetchData() {
            fetchDataCalled = true
        }
    }

    class MockExperienceListRouter: ExperienceListRouter {
        var model: Experience!
        override func showExperienceDetail(with model: Experience) {
            self.model = model
        }
    }
    
    var view: MockExperienceListView!
    var sut: ExperienceListPresenter!
    var interactor: MockExperienceListInteractor!
    var router: MockExperienceListRouter!
    
    override func setUp() {
        view = MockExperienceListView()
        interactor = MockExperienceListInteractor()
        router = MockExperienceListRouter()
        sut = ExperienceListPresenter(view: view, interactor: interactor, router: router)
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        interactor = nil
        router = nil
        sut = nil
    }

    func testFetchDataCalled(){
        sut.fetchData()
        XCTAssertTrue(interactor.fetchDataCalled)
    }
    
    func testGetCellToDrawWithEmptyArrayAndIndex0() {
        fetchDataWithEmptyArray()
        let cell = sut.getCell(at: 0)
        XCTAssertNil(cell)
    }
    
    func testGetCellToDrawWithNotEmptyArrayAndIndex0() {
        fetchDataWithNotEmptyArray()
        let cell = sut.getCell(at: 0)
        XCTAssertNotNil(cell)
    }
    
    func testShowExperienceDetailWithIndex0() {
        fetchDataWithNotEmptyArray()
        sut.showExperienceDetail(with: 0)
        guard let cell =  sut.cells[0] as? ExperienceListCellModel else {
            XCTFail("Not model provided")
            return
        }
        XCTAssertEqual(router.model, cell.model)
    }
    
    func testShowNetworkError(){
        fetchDataWith(error: .notNetworkConnection)
        guard let viewShowErrorCalled = view?.showErrorCalled, let errorMessage = view?.errorMessage else {
            XCTFail("Presenter fails calling view to show error")
            return
        }
        XCTAssertTrue(viewShowErrorCalled)
        XCTAssertEqual(errorMessage, ServiceError.notNetworkConnection.rawValue)
    }
    
    func testShowResourceNotFoundError(){
        fetchDataWith(error: .resourceNotFound)
        guard let viewShowErrorCalled = view?.showErrorCalled, let errorMessage = view?.errorMessage else {
            XCTFail("Presenter fails calling view to show error")
            return
        }
        XCTAssertTrue(viewShowErrorCalled)
        XCTAssertEqual(errorMessage, ServiceError.resourceNotFound.rawValue)
    }
    
    
    func testShowParsingDataError(){
        fetchDataWith(error: .dataError)
        guard let viewShowErrorCalled = view?.showErrorCalled, let errorMessage = view?.errorMessage else {
            XCTFail("Presenter fails calling view to show error")
            return
        }
        XCTAssertTrue(viewShowErrorCalled)
        XCTAssertEqual(errorMessage, ServiceError.dataError.rawValue)
    }
    
        
    //Helpers
    func fetchDataWithNotEmptyArray() {
         sut.fetchData()
         sut.refreshViewList(with: StubNetworkAPIResult.data)
    }
    
    func fetchDataWithEmptyArray() {
        sut.fetchData()
        sut.refreshViewList(with: StubNetworkAPIResult.emptyData)
    }
    
    func fetchDataWith(error: ServiceError) {
        sut.fetchData()
        sut.showLoadingError(with: error)
    }
}
