//
//  MockExperienceListInteractorOutput.swift
//  CVChallengeTests
//
//  Created by isela on 6/12/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation
@testable import CVChallenge

class MockExperienceListInteractorOutput: ExperienceListInteractorOutputProtocol {

    var cells: [DrawableCellProtocol] = []
    var error: ServiceError?
    var experienceArray: [Experience] = [] {
        didSet{
            cells = experienceArray.map({ExperienceListCellModel(model: $0)})
        }
    }
    func refreshViewList(with data: [Experience]) {
        experienceArray = data
    }
    
    func showLoadingError(with error: ServiceError) {
        self.error = error
    }
}
