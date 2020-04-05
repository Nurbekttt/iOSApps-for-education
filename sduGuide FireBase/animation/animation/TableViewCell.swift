//
//  TableViewCell.swift
//  animation
//
//  Created by Nurbek on 11/17/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var processor: UILabel!
    @IBOutlet weak var pixel: UILabel!
    @IBOutlet weak var hide: UIButton!
    @IBOutlet weak var view: UIView!
    var index: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        hide.layer.cornerRadius = 5
        hide.layer.borderColor = UIColor.white.cgColor
        hide.layer.borderWidth = 1
        // Configure the view for the selected state
    }

    @IBAction func buttonPressed(_ sender: Any) {
        print(index as Any)
        self.view.isHidden=false
        var mod = CATransform3DIdentity
        mod.m34 = 1/1000
        self.view.layer.transform = CATransform3DRotate(mod, 90 * (.pi / 180), 0, 1, 0)
        UIView.animate(withDuration: 1){
            self.view.layer.transform = CATransform3DRotate(mod, 0, 0, 1, 0)
        }
        UIView.animate(withDuration: 0.5){
            self.view.alpha=1
        }
    }
    @IBAction func hide(_ sender: UIButton) {
        UIView.animate(withDuration: 1){
            self.view.transform = CGAffineTransform(translationX: 300, y: 0)
        }
        UIView.animate(withDuration: 1){
            self.view.alpha=0
        }
        
    }
    
}
