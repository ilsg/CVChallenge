//
//  String-Extension.swift
//  CVChallenge
//
//  Created by isela on 6/17/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
