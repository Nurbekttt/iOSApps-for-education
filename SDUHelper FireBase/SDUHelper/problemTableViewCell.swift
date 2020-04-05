//
//  problemTableViewCell.swift
//  SDUHelper
//
//  Created by Nurbek on 12/21/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class problemTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var numOfComments: UILabel!
    @IBOutlet weak var numOfLikes: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    func configureCell(with model: Problem) {
        title.text = model.title
        numOfComments.text = model.comments
        numOfLikes.text = model.likes
        timeLabel.text = getDateAsString(model.date!)
    }
    
    // MARK: - Converts (Date -> String)
    func getDateAsString(_ date: Date) -> String {
        let dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dateAsString = dateFormatter.string(from: date)
        return dateAsString
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
