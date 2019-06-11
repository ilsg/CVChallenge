//
//  ImageService.swift
//  CVChallenge
//
//  Created by isela on 6/17/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

protocol ImageServiceProtocol {
    func downloadImageWith(url: String, with callback: @escaping ( ServiceResult<Data>)-> Void)
}

class ImageService: ImageServiceProtocol {
    typealias Result = ServiceResult<Data>
    private let networking = NetworkAPI()
    
    /// Download the data image for the given url
    ///
    /// - Parameters:
    ///   - url: String of the url hosted image
    ///   - callback: Void method that receives a ServiceResult
    func downloadImageWith(url: String, with callback: @escaping (Result)-> Void){
        networking.dataRequest(url: url) { (result: Result) in
            callback(result)
        }
    }
}
