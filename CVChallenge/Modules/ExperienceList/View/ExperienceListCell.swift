//
//  ExperienceListCell.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

class ExperienceListCell: UITableViewCell, ExperienceListCellProtocol {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        selectionStyle = .none
       setupAccessibilityIdentifiers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAccessibilityIdentifiers() {
        self.accessibilityIdentifier = CellIdentifier.experienceListCell.rawValue
        textLabel?.accessibilityIdentifier = AccessibilityIdentifiers.experienceListCellTitleLabel.rawValue
        detailTextLabel?.accessibilityIdentifier = AccessibilityIdentifiers.experienceListCellSubtitleLabel.rawValue
    }
    
    func fill(with model: Experience) {
        textLabel?.text = model.company
        detailTextLabel?.text = model.years
    }
}

struct ExperienceListCellModel: DrawableCellProtocol {
    var model: Experience
    
    func cellForTableView(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: CellIdentifier.experienceListCell.rawValue, for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell) {
        if let cell = cell as? ExperienceListCellProtocol {
            cell.fill(with: model)
        }
    }
}
