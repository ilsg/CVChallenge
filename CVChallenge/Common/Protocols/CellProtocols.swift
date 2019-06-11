//
//  CellProtocols.swift
//  CVChallenge
//
//  Created by isela on 6/10/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

protocol DrawableCellProtocol {
    func cellForTableView(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    func drawCell(_ cell: UITableViewCell)
}

protocol ExperienceListCellProtocol {
    func fill(with model: Experience)
}
protocol ExperienceDetailHeaderCellProtocol {
    func fill(with title:String?, and imageData: Data?)
}
protocol ExperienceDetailPositionCellProtocol {
    func fill(with position: String, and years: String)
}
protocol ExperienceDetailSummaryCellProtocol {
    func fill(with summary: String)
}
protocol EmptyCellProtocol {
    func fill(with message: String)
}
