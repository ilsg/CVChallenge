//
//  ExperienceListInteractorTests.swift
//  CVChallengeTests
//
//  Created by isela on 6/12/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest
@testable import CVChallenge

class ExperienceListInteractorTests: XCTestCase {
    
    //Properties
    var sut: ExperienceListInteractor!
    var mockInteractorOutput: MockExperienceListInteractorOutput?
    var mockNetworkAPI: MockNeworkAPI!
    
    override func setUp() {
        super.setUp()
        sut = ExperienceListInteractor()
        mockInteractorOutput = MockExperienceListInteractorOutput()
        mockNetworkAPI = MockNeworkAPI()
        sut.serviceClient = mockNetworkAPI
        sut.output = mockInteractorOutput
    }
    

    override func tearDown() {
        mockInteractorOutput = nil
        mockNetworkAPI = nil
        sut = nil
    }

    func testFetchedDataWithSuccessReturnsExperienceArray(){
       loadExperienceListWithSuccess()
        guard let outputArray = mockInteractorOutput?.experienceArray else {
            XCTFail("Not data returned")
            return
        }
        XCTAssertEqual(outputArray, StubNetworkAPIResult.data)
    }
    
    func testFetchedDataWihSuccessReturnsDataError(){
        loadExperienceListWithSuccessDataError()
        guard let error = mockInteractorOutput?.error else {
            XCTFail("No response")
            return
        }
        XCTAssertEqual(error, ServiceError.dataError)
    }
    
    func testFetchedDataWihErrorReturnsNetworkError(){
        loadExperienceListWithNetworkConnectionError()
        guard let error = mockInteractorOutput?.error else {
            XCTFail("No response")
            return
        }
        XCTAssertEqual(error, ServiceError.notNetworkConnection)
    }
    
    func testFetchedDataWihErrorReturnsResourceError(){
        loadExperienceListWithNetworkResourceError()
        guard let error = mockInteractorOutput?.error else {
            XCTFail("No response")
            return
        }
        XCTAssertEqual(error, ServiceError.resourceNotFound)
    }
    
    //Helpers
    func loadExperienceListWithSuccess(){
        mockNetworkAPI?.result = StubNetworkAPIResult.successResult
        sut.fetchData()
    }
    
    func loadExperienceListWithSuccessDataError(){
        mockNetworkAPI?.result = StubNetworkAPIResult.errorDataResult
        sut.fetchData()
    }

    func loadExperienceListWithNetworkConnectionError(){
        mockNetworkAPI?.result = StubNetworkAPIResult.errorConnectionResult
        sut.fetchData()
    }
    
    func loadExperienceListWithNetworkResourceError(){
        mockNetworkAPI?.result = StubNetworkAPIResult.errorNotFoundResult
        sut.fetchData()
    }
}
