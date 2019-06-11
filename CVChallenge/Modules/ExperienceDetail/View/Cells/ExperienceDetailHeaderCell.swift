//
//  ExperienceDetailHeaderCell.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

class ExperienceDetailHeaderCell: UITableViewCell, ExperienceDetailHeaderCellProtocol{
    static let cellIdentifier = "ExperienceDetailHeaderCell"
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 120, height: 120)))
        imageView.image = UIImage(named: "default_image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        contentView.addSubview(logoImageView)
        contentView.addSubview(companyLabel)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: logoImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120),
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            companyLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
            companyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            companyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
    }
    
    private func setupAccessibilityIdentifiers() {
        self.accessibilityIdentifier = AccessibilityIdentifiers.experienceDetailHeaderCell.rawValue
        logoImageView.accessibilityIdentifier = AccessibilityIdentifiers.experienceDetailHeaderCellImage.rawValue
        companyLabel.accessibilityIdentifier = AccessibilityIdentifiers.experienceDetailHeaderCellLabel.rawValue
    }
    
    func fill(with title: String?, and imageData: Data?) {
        companyLabel.text = title
        if let data = imageData {
            logoImageView.image = UIImage(data: data)
        }
    }

}

struct ExperienceDetailHeaderCellModel: DrawableCellProtocol{
    var company: String
    var imageData: Data?
    
    func cellForTableView(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ExperienceDetailHeaderCell.cellIdentifier, for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell) {
        if let cell = cell as? ExperienceDetailHeaderCellProtocol {
            cell.fill(with: company, and: imageData)
        }
    }
}
