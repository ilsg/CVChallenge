//
//  ExperienceDetailRouter.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

class ExperienceDetailRouter: ExperienceDetailRouterProtocol {
    /// Creates the instance of the ExperienceDetailView module and its dependencies
    ///
    /// - Returns: ExperienceDetailView
    static func createModule(with model: Experience) -> ExperienceDetailView {
        let vc = ExperienceDetailView()
        let interactor: ExperienceDetailInteractorProtocol = ExperienceDetailInteractor()
        let presenter: ExperienceDetailPresenterProtocol = ExperienceDetailPresenter(view: vc, interactor : interactor, model: model)
        vc.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}
