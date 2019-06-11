//
//  ExperienceListInteractor.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

class ExperienceListInteractor: ExperienceListInteractorProtocol {
    weak var output: ExperienceListInteractorOutputProtocol?
    lazy var serviceClient: ExperienceServiceProtocol = ExperienceService()
    
    /// Fetch de data from the serviceClient
    func fetchData() {
        serviceClient.fetchExperienceList(for: Endpoint.experienceList.rawValue) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.output?.refreshViewList(with: data)
            case .error(let error):
                self.output?.showLoadingError(with:error)
            }
        }
    }
}
