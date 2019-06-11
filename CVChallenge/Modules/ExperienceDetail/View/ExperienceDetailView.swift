//
//  ExperienceDetailView.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

class ExperienceDetailView: UIViewController, TableViewProtocol, AlertControllerProtocol {

    private weak var tableView: UITableView!
    var presenter: ExperienceDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.loadDetail()
    }
    
    /// View setup operations, adds the tableView and register its cells.
    private func setupView() {
        view.backgroundColor = .white
        title =  ScreenTitle.detailView.localizedString
        tableView = createTableView()
        tableView.register(ExperienceDetailHeaderCell.self, forCellReuseIdentifier: CellIdentifier.experienceDetailHeaderCell.rawValue)
        tableView.register(ExperienceDetailPositionCell.self, forCellReuseIdentifier: CellIdentifier.experienceDetailPositionCell.rawValue)
        tableView.register(ExperienceDetailSummaryCell.self, forCellReuseIdentifier: CellIdentifier.experienceDetailSummaryCell.rawValue)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.dataSource = self
        tableView.accessibilityIdentifier = AccessibilityIdentifiers.experienceDetailTableView.rawValue
    }
}

//MARK: UITableView delegates
extension ExperienceDetailView: UITableViewDataSource {
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
}

extension ExperienceDetailView: ExperienceDetailViewProtocol {
    func refreshView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError(with message: String?, then callback: (() -> Void)?) {
        showAlertError(message, callback: callback)
    }
}
