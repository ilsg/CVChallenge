//
//  ExperienceListRouter.swift
//  CVChallenge
//
//  Created by isela on 6/10/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

class ExperienceListRouter: ExperienceListRouterProtocol, TopViewControllerProtocol {
    
    /// Creates the instance of the ExperienceList module and its dependencies
    ///
    /// - Returns: ExperienceListView
    static func createModule() -> ExperienceListView {
        let vc = ExperienceListView()
        let interactor: ExperienceListInteractorProtocol = ExperienceListInteractor()
        let router: ExperienceListRouterProtocol = ExperienceListRouter()
        let presenter: ExperienceListPresenterProtocol & ExperienceListInteractorOutputProtocol = ExperienceListPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        interactor.output = presenter
        return vc
    }
    
    
    /// Instanciate the ExperienceDetail module and pushes it to the navigationController.
    ///
    /// - Parameter model: Model of type Experience
    func showExperienceDetail(with model: Experience) {
        let view = ExperienceDetailRouter.createModule(with: model)
        guard let topNavController = topNavController else { return }
        topNavController.pushViewController(view, animated: true)
    }
}
