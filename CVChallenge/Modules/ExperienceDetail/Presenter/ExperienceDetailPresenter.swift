//
//  ExperienceDetailPresenter.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

class ExperienceDetailPresenter: ExperienceDetailPresenterProtocol {
    //MARK: Properties
    weak var view: ExperienceDetailViewProtocol?
    private let interactor: ExperienceDetailInteractorProtocol
    private var model: Experience
    private var cells: [DrawableCellProtocol] = []
    
    init(view: ExperienceDetailViewProtocol, interactor: ExperienceDetailInteractorProtocol, model: Experience){
        self.view = view
        self.interactor = interactor
        self.model = model
    }
    
    /// Returns the number of cells to draw
    var rowsCount: Int {
        return cells.count
    }
    
    /// Retrieves the cell to draw by the tableview
    ///
    /// - Parameter index: Indexpath for the current cell
    /// - Returns: Model conforming to the DrawableCellProtocol
    func getCell(at index: Int) -> DrawableCellProtocol? {
        if rowsCount > 0 {
            return cells[index]
        }
        return nil
    }
    
    /// Loads the data model, and asks the interactor to fetch the image.
    func loadDetail() {
        mapCells()
        view?.refreshView()
        interactor.downloadImage(with: model.imageUrl)
    }
    
    private func mapCells() {
        cells.removeAll()
        let headerModel = ExperienceDetailHeaderCellModel(company: model.company, imageData: model.imageData)
        let positionModel = ExperienceDetailPositionCellModel(position: model.position, years: model.years)
        let summaryModel = ExperienceDetailSummaryCellModel(summary: model.description)
        self.cells = [headerModel,positionModel, summaryModel]
    }
    
    
    /// Updates the model with the data image retrieved.
    ///
    /// - Parameter data: Data for the image downloaded.
    func downloadImageSucceded(with data: Data){
        model.imageData = data
        mapCells()
        view?.refreshView()
    }
    
    func downloadImageError(with error: ServiceError) {
        view?.showError(with: error.rawValue, then: nil)
    }
}
