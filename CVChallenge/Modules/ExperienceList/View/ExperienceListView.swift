//
//  ExperienceListView.swift
//  CVChallenge
//
//  Created by isela on 6/10/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

class ExperienceListView: UIViewController, TableViewProtocol, AlertControllerProtocol, ProgressIndicatorProtocol {
    //MARK: Properties
    private weak var tableView: UITableView!
    var presenter: ExperienceListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.fetchData()
    }
    
    
    /// View setup operations, adds the tableView and register its cells.
    private func setupView() {
        view.backgroundColor = .white
        title = ScreenTitle.experienceListView.localizedString
        tableView = createTableView()
        tableView.register(ExperienceListCell.self, forCellReuseIdentifier: CellIdentifier.experienceListCell.rawValue)
        tableView.register(EmptyCell.self, forCellReuseIdentifier: CellIdentifier.emptyCell.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.accessibilityIdentifier = AccessibilityIdentifiers.experienceListTableView.rawValue
    }
}

//MARK: UITableView Delegates
extension ExperienceListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.rowsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = presenter?.getCell(at: indexPath.row)
        if let cell = model?.cellForTableView(tableView, at: indexPath) {
            model?.drawCell(cell)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showExperienceDetail(with: indexPath.row)
    }

}

//MARK: View interface
extension ExperienceListView: ExperienceListViewProtocol {
    
    func refreshView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError(with message: String?, then callback: (() -> Void)?) {
        showAlertError(message, callback: callback)
    }
    
    func showLoading() { showProgressIndicator() }
    
    func hideLoading() { hideProgressIndicator() }
}
