//
//  ExperienceListPresenter.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

class ExperienceListPresenter: ExperienceListPresenterProtocol {
    private weak var view: ExperienceListViewProtocol?
    private let interactor: ExperienceListInteractorProtocol
    private let router: ExperienceListRouterProtocol?
    var cells: [DrawableCellProtocol] = []
    
    init(view: ExperienceListViewProtocol, interactor: ExperienceListInteractorProtocol, router: ExperienceListRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    /// Called on viewDidLoad, calls the interactor to retrieve the data.
    func fetchData() {
        view?.showLoading()
        interactor.fetchData()
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
    
    
    /// Presents the detail view of the selected row
    ///
    /// - Parameter index: Index of the tableviewcell tapped
    func showExperienceDetail(with index: Int) {
        guard let cell =  getCell(at: index) as? ExperienceListCellModel else { return }
        router?.showExperienceDetail(with: cell.model)
    }
    
    
    /// Refresh the view with the empty state
    func showEmptyTable() {
        cells = [EmptyCellModel(message: Message.noDataFound.localizedString)]
        view?.refreshView()
    }

}

//MARK: Interactor output
extension ExperienceListPresenter: ExperienceListInteractorOutputProtocol {
    
    /// Called form the interactor when the data was succcesfully fetched.
    /// Maps the result to the models and updates the view
    ///
    /// - Parameter data: Model array of type Experience
    func refreshViewList(with data: [Experience]) {
        cells =  data.map({ ExperienceListCellModel(model: $0)})
        view?.refreshView()
        view?.hideLoading()
    }
    
    
    /// Called from the interactor on error case. Updates the view with the message error thrown.
    ///
    /// - Parameter error: ServiceError
    func showLoadingError(with error: ServiceError) {
        view?.hideLoading()
        view?.showError(with: error.rawValue, then: { [weak self] in
            self?.cells.removeAll()
            self?.showEmptyTable()
        })
    }
}
