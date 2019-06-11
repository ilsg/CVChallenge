//
//  Constants.swift
//  CVChallenge
//
//  Created by isela on 6/10/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

protocol LocalizableProtocol {
    var localizedString: String { get }
}

/// Constants used throught the app
struct Constants {
    static let progressIndicatorViewTag = 1001
}

/// Titles of the pages
enum ScreenTitle: String, LocalizableProtocol {
    case experienceListView = "experience_list_title"
    case detailView = "detail_view_title"
    
    var localizedString: String {
        return self.rawValue.localize()
    }
}

/// Messages
enum Message: String, LocalizableProtocol {
    case noDataFound = "no_data_found"
    
    var localizedString: String {
        return self.rawValue.localize()
    }
}
