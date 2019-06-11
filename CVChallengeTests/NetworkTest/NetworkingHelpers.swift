//
//  NetworkingHelpers.swift
//  CVChallengeTests
//
//  Created by Isela Leticia Soto Galindo on 6/26/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation
@testable import CVChallenge

//Mocks classes
class MockURLSessionDataTask: URLSessionDataTask {
    private (set) var resumeCalled = false
    override func resume() {
        resumeCalled = true
    }
}

class MockURLSession: URLSessionProtocol {
    var nextDataTask = MockURLSessionDataTask()
    var nextData: Data?
    var nextError: Error?
    private (set) var lastURL: URL?
    
    func getHttpUrlResponse(request: URLRequest) -> URLResponse {
         let statusCode = nextError == nil ? 200 : 400
         return HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: "HTTP/1.1", headerFields: nil)!
    }
    
    func dataTaskWith(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = request.url
        let urlResponse = getHttpUrlResponse(request: request)
        completionHandler(nextData, urlResponse, nextError)
        return nextDataTask
    }
}

struct MockModel: Codable, Equatable {
    var data : String
}
