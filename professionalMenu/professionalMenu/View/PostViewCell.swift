//
//  PostViewCell.swift
//  professionalMenu
//
//  Created by Nurbek on 1/24/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import UIKit
//import SnapKit
class PostViewCell: UITableViewCell {

    // MARK: - Properties
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = #colorLiteral(red: 0.1850318015, green: 0.2771938741, blue: 0.5308662057, alpha: 1)
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.text = "The portal is not working"
        lb.numberOfLines = 0
        lb.sizeToFit()
        return lb
    }()
    let contentLabel: UILabel = {
        let lb = UILabel()
        lb.tintColor = #colorLiteral(red: 0.1850318015, green: 0.2771938741, blue: 0.5308662057, alpha: 1)
        return lb
    }()
   
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let newView = UIView()
        
        addSubview(newView)
        backgroundColor = #colorLiteral(red: 0.9600958228, green: 0.9645503163, blue: 0.9819015861, alpha: 1)
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = #colorLiteral(red: 0.7547196746, green: 0.7684126496, blue: 0.8031680584, alpha: 1)
        newView.layer.cornerRadius = 20
        //newView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        newView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        newView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        newView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        // you can also put image here
        newView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: newView.topAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: newView.leftAnchor, constant: 20).isActive = true
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
