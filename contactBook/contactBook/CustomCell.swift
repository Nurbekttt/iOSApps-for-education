//
//  CustomCell.swift
//  contactBook
//
//  Created by Nurbek on 9/24/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var ContactImageView: UIImageView!
    
    
    @IBOutlet weak var ContactName: UILabel!
    
    @IBOutlet weak var ContactPhoneNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
