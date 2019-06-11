//
//  MockExperienceListView.swift
//  CVChallengeTests
//
//  Created by isela on 6/12/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation
@testable import CVChallenge

class MockExperienceListView: ExperienceListViewProtocol {
    var refreshViewCalled = false
    var showNoContentScreenCalled = false
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var showErrorCalled = false
    var errorMessage: String?
    
    func refreshView() {
        refreshViewCalled = true
    }
    
    func showNoContentScreen() {
        showNoContentScreenCalled = true
    }
    
    func showLoading() {
        showLoadingCalled = true
    }
    
    func hideLoading() {
        showLoadingCalled = true
    }
    
    func showError(with message: String?, then callback: (() -> Void)?) {
        showErrorCalled = true
        errorMessage = message
    }
    
}

