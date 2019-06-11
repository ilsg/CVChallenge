//
//  APITypes.swift
//  CVChallenge
//
//  Created by isela on 6/17/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

/// Represents the errors thrown by an network request.
enum ServiceError: String, Error{
    /// Error processing the data.
    case dataError = "data_error"
    /// The remote endpoint was not reachable.
    case resourceNotFound = "resource_found_error"
    /// Not network connection available.
    case notNetworkConnection = "network_error"
}

/// Generic result type to return from service.
enum ServiceResult<T>{
    /// Success recieves the data to pass
    case success(T)
    /// Error returns an error of type ServiceError
    case error(ServiceError)
}


struct API {
    static let baseURL = "https://gist.githubusercontent.com/ilsg/%@"
}

enum Endpoint: String {
    case experienceList = "8a9a470e0e63ff0d77b875817bf6eeab/raw/e02acda1230358df3a70bdf686edfcb147097842/jobs.json"
}
