//
//  EmptyCell.swift
//  CVChallenge
//
//  Created by isela on 6/13/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

struct EmptyCellModel: DrawableCellProtocol {
    let message: String
    
    func cellForTableView(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: CellIdentifier.emptyCell.rawValue, for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell) {
        if let cell = cell as? EmptyCellProtocol {
               cell.fill(with: message)
        }
    }
}

class EmptyCell: UITableViewCell, EmptyCellProtocol {
    
    private var labelMessage: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var emptyImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image_error")
        return image
    }()
    
    func fill(with message: String) {
        setupView()
        labelMessage.text = message
        selectionStyle = .none
        isUserInteractionEnabled = false
        setupAccessibilityIdentifiers()
    }
    
    private func setupView() {
        contentView.addSubview(emptyImageView)
        contentView.addSubview(labelMessage)
        
        NSLayoutConstraint.activate([
            emptyImageView.widthAnchor.constraint(equalToConstant: 80),
            emptyImageView.heightAnchor.constraint(equalToConstant: 80),
            emptyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            emptyImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelMessage.topAnchor.constraint(equalTo: emptyImageView.bottomAnchor, constant: 20),
            labelMessage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            labelMessage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            contentView.bottomAnchor.constraint(equalTo: labelMessage.bottomAnchor, constant: 20)
        ])
    }
    
    private func setupAccessibilityIdentifiers() {
        self.accessibilityIdentifier = AccessibilityIdentifiers.emptyCell.rawValue
        labelMessage.accessibilityIdentifier = AccessibilityIdentifiers.emptyCellLabel.rawValue
        emptyImageView.accessibilityIdentifier = AccessibilityIdentifiers.emptyCellImage.rawValue
    }
}
