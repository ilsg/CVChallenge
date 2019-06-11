//
//  Experience.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit


/// Data model to represent items
struct Experience: Codable, Equatable {
    var company: String
    var position: String
    var years: String
    var description: String
    var imageUrl: String
    var imageData: Data?
    
    private enum CodingKeys: String, CodingKey {
        case company
        case position
        case years
        case description
        case imageUrl = "logo"
    }
}
