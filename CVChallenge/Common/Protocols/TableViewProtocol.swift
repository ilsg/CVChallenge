//
//  TableViewProtocol.swift
//  CVChallenge
//
//  Created by isela on 6/10/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

protocol TableViewProtocol {
    func createTableView()-> UITableView
}

extension TableViewProtocol where Self: UIViewController {

    /// Default implementation of TableViewProtocol.
    ///
    /// - Returns: An instance of UITableView.
    func createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        tableView.tableFooterView = UIView()
        return tableView
    }
}
