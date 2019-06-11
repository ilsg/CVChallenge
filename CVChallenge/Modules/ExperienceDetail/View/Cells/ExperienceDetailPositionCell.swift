//
//  ExperienceDetailPositionCell.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

class ExperienceDetailPositionCell: UITableViewCell, ExperienceDetailPositionCellProtocol {
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupAccessibilityIdentifiers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAccessibilityIdentifiers() {
        self.accessibilityIdentifier = AccessibilityIdentifiers.experienceDetailPositionCell.rawValue
        textLabel?.accessibilityIdentifier = AccessibilityIdentifiers.experienceDetailPositionCellTitleLabel.rawValue
        detailTextLabel?.accessibilityIdentifier = AccessibilityIdentifiers.experienceDetailPositionCellSubtitleLabel.rawValue
    }
    
    func fill(with position: String, and years: String) {
        textLabel?.text = position
        detailTextLabel?.text = years
    }
}

struct ExperienceDetailPositionCellModel: DrawableCellProtocol {
    var position: String
    var years: String
    
    func cellForTableView(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: CellIdentifier.experienceDetailPositionCell.rawValue, for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell) {
        if let cell = cell as? ExperienceDetailPositionCellProtocol {
            cell.fill(with: position, and: years)
        }
    }
}
