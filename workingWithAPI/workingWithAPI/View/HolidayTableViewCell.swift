//
//  HolidayTableViewCell.swift
//  workingWithAPI
//
//  Created by Nurbek on 2/12/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import UIKit

class HolidayTableViewCell: UITableViewCell {
    // MARK: - Properties
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 10).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
