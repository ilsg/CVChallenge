//
//  ExperienceListProtocol.swift
//  CVChallenge
//
//  Created by isela on 6/10/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

protocol ExperienceListViewProtocol: class {
    func refreshView()
    func showLoading()
    func hideLoading()
    func showError(with message: String?, then callback:(() -> Void)?)
}

protocol ExperienceListPresenterProtocol: class {
    var rowsCount: Int {get}
    func fetchData()
    func showExperienceDetail(with index: Int)
    func getCell(at index: Int)-> DrawableCellProtocol?
}

protocol ExperienceListInteractorProtocol: class {
    var output: ExperienceListInteractorOutputProtocol? {get set}
    func fetchData()
}

protocol ExperienceListInteractorOutputProtocol: class {
    var cells: [DrawableCellProtocol] {get set}
    func refreshViewList(with data: [Experience])
    func showLoadingError(with error: ServiceError)
}

protocol ExperienceListRouterProtocol {
    static func createModule() -> ExperienceListView
    func showExperienceDetail(with model: Experience)
}
