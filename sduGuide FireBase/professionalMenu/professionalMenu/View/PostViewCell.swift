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
    
   
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.8764027953, green: 0.8898026347, blue: 0.9333173633, alpha: 1)
        let newView = UIView()
        /// change size as you need.
        addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = UIColor.red
        newView.layer.cornerRadius = 20
        //newView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        newView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        newView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        newView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        // you can also put image here
        

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
