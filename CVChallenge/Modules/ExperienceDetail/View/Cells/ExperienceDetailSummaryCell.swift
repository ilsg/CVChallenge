//
//  ExperienceDetailSummaryCell.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

class ExperienceDetailSummaryCell: UITableViewCell, ExperienceDetailSummaryCellProtocol {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
        setupAccessibilityIdentifiers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        textLabel?.numberOfLines = 0
        textLabel?.lineBreakMode = .byWordWrapping
    }
    
    private func setupAccessibilityIdentifiers() {
        self.accessibilityIdentifier = AccessibilityIdentifiers.experienceDetailSummaryCell.rawValue
       textLabel?.accessibilityIdentifier = AccessibilityIdentifiers.experienceDetailSummaryCellLabel.rawValue
    }

    func fill(with summary: String) {
        textLabel?.text = summary
    }

}

struct ExperienceDetailSummaryCellModel: DrawableCellProtocol {
    var summary: String
    
    func cellForTableView(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: CellIdentifier.experienceDetailSummaryCell.rawValue, for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell) {
        if let cell = cell as? ExperienceDetailSummaryCellProtocol {
            cell.fill(with: summary)
        }
    }
}
