//
//  menuTableViewController.swift
//  sduGuide
//
//  Created by Nurbek on 10/19/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class menuTableViewController: UITableViewController {
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var facultyImage: UIImageView!
    
    @IBOutlet weak var clubImage: UIImageView!
    
    @IBOutlet weak var socialImage: UIImageView!
    
    @IBOutlet weak var contactImage: UIImageView!
    
    enum MenuType: Int {
        case news
        case faculty
        case club
        case social
        case contact
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        
        print("Dismissing: \(menuType)")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "\(menuType)VC") else { return }
        
        
        vc.modalTransitionStyle = .crossDissolve
        
        present(vc, animated: true)
        
        
        
        
            
       
    }

    

}

