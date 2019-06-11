//
//  NetworkAPI.swift
//  CVChallenge
//
//  Created by Isela Leticia Soto Galindo on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func dataTaskWith(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}
protocol URLSessionDataTaskProtocol {
    func resume()
}

//Conform to URL Protocols
extension URLSessionDataTask: URLSessionDataTaskProtocol {}

extension URLSession: URLSessionProtocol {
    func dataTaskWith(request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTaskProtocol
    }
}

/// NetworkProtocol exposes the generic operations to perform throguht the network
protocol NetworkProtocol {
    func jsonRequest<T:Decodable>(url: String, completion: @escaping (ServiceResult<T>) -> Void)
    func dataRequest(url: String,  completion: @escaping (ServiceResult<Data>) -> Void)
}

/// Provides the default implementation for the NetworkProtocol
class NetworkAPI: NetworkProtocol {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared){
        self.session = session
    }
   
    /// Method to fecth generic data that conforms to Decodable protocol
    ///
    /// - Parameters:
    ///   - url: Url string to network resource
    ///   - completion: Receives a callback for handling the result of type ServiceResult<T>
    func jsonRequest<T:Decodable>(url: String, completion: @escaping (ServiceResult<T>) -> Void){
        guard let url = URL(string: url) else {
            completion(.error(.resourceNotFound))
            return
        }
        session.dataTaskWith(request: URLRequest(url: url)) {
            (data, response, error) in
            if let _ = error {
                completion(.error(.notNetworkConnection))
            } else {
                if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                    completion(.error(.resourceNotFound))
                }
                guard let data = data, let json = try? JSONDecoder().decode(T.self, from: data) else {
                    completion(.error(.dataError))
                    return
                }
                completion(.success(json))
            }
        }.resume()
    }
    
    
    /// Method to fetch data from network
    ///
    /// - Parameters:
    ///   - url: String url to network resource
    ///   - completion: Receives a callback for handling the result of type Data
    func dataRequest(url: String, completion: @escaping (ServiceResult<Data>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.error(.resourceNotFound))
            return
        }
        session.dataTaskWith(request: URLRequest(url: url)) {
            (data, response, error) in
            if let _ = error {
                completion(.error(.notNetworkConnection))
            } else {
                if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                    completion(.error(.resourceNotFound))
                }
                guard let data = data  else {
                    completion(.error(.dataError))
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
}
