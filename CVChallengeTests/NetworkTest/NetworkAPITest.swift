//
//  NetworkAPITest.swift
//  CVChallengeTests
//
//  Created by Isela Leticia Soto Galindo on 6/26/19.
//  Copyright © 2019 isela. All rights reserved.
//

import XCTest
@testable import CVChallenge

class NetworkAPITest: XCTestCase {

    typealias Result = (ServiceResult<MockModel>)
    var networkAPI: NetworkAPI!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        networkAPI = NetworkAPI(session: session)
    }

    override func tearDown() {
       super.tearDown()
    }

    func testJsonRequestWithURL() {
        guard let url = URL(string: "https://host.com/repository.json") else {
            XCTFail("Url can't be empty")
            return
        }
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        networkAPI.jsonRequest(url: "https://host.com/repository.json") { (result: Result) in }
        
        XCTAssertTrue(session.lastURL == url)
    }
    
    func testJsonRequestResumeCalled() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        networkAPI.jsonRequest(url: "https://host.com/repository.json") { (result: Result) in }
        XCTAssert(dataTask.resumeCalled)
    }
   
    func testJsonRequestWithNoUrl() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        networkAPI.jsonRequest(url: "") { (result: Result) in
            switch result {
            case .error(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error, ServiceError.resourceNotFound)
            case .success(_):
                XCTFail("Fail no data expected")
            }
        }
    }
    
    func testJsonRequestNotNetworkConnection() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        session.nextError = NSError(domain: "https://host.com", code: 400, userInfo: nil)
        networkAPI.jsonRequest(url: "https://host.com/repository.json") { (result: Result) in
            switch result {
            case .error(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error, ServiceError.notNetworkConnection)
            case .success(_):
                XCTFail("Fail no data expected")
            }
        }
    }
    
    func testJsonRequesWithNoReturnData() {
        let expectationFetchJson = expectation(description: "jsonRequest")
        let dataTask = MockURLSessionDataTask()
        
        session.nextDataTask = dataTask
        networkAPI.jsonRequest(url: "https://host.com/repository.json") { (result: Result) in
            switch result {
            case .error(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error, ServiceError.dataError)
            case .success(_):
                XCTFail("Fail not data expected")
            }
            expectationFetchJson.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            guard let _ = error else{ return }
            XCTFail("Expectation Failure")
        }
    }
    
    func testJsonRequestShouldReturnData() {
        let expectationFetchJson = expectation(description: "jsonRequest")
        let expectedData = MockModel(data: "test")
        
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        session.nextData = try? JSONEncoder().encode(expectedData)
        networkAPI.jsonRequest(url: "https://host.com/repository.json") { (result: Result) in
            switch result {
            case .error(_):
                XCTFail("Fail error not expected")
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data, expectedData)
            }
            expectationFetchJson.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            guard let _ = error else{ return }
            XCTFail("Expectation Failure")
        }
    }
    
    func testDataRequestWithURL() {
        guard let url = URL(string: "https://host.com/repository.json") else {
            XCTFail("Url can't be empty")
            return
        }
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        networkAPI.dataRequest(url: "https://host.com/repository.json") { (result: ServiceResult<Data>) in }

        XCTAssertTrue(session.lastURL == url)
    }
    
    func testDataRequestResumeCalled() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        networkAPI.dataRequest(url: "https://host.com/repository.json") { (result: ServiceResult<Data>) in }
        
        XCTAssert(dataTask.resumeCalled)
    }
    
    func testDataRequestShouldReturnData() {
        let expectationFetchData = expectation(description: "dataRequest")
        let urlString = "https://host.com/repository.json"
        let expectedData = "{}".data(using: .utf8)
       
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        session.nextData = expectedData
        networkAPI.dataRequest(url: urlString) { (result: ServiceResult<Data>) in
            switch result {
            case .error(_):
                XCTFail("Fail error not expected")
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data, expectedData)
            }
            expectationFetchData.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            guard let _ = error else{ return }
            XCTFail("Expectation Failure")
        }
    }
}
