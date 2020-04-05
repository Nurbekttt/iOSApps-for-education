//
//  ViewController.swift
//  contactBook
//
//  Created by Nurbek on 9/23/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var myTableView: UITableView!
    var contacts = [Contact.init("Nurbek", "Tuleugaliyev", "87474848374", UIImage.init(named: "male")!)]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = (myTableView.indexPathForSelectedRow?.row)!
        let vc = segue.destination as! DetailViewController
        vc.nameSurname = self.contacts[index].surname! + " " + self.contacts[index].name!
        vc.image = self.contacts[index].image!
        vc.phoneNumber = self.contacts[index].phoneNumber!
        print("hello")
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "1") as? CustomCell
        cell?.ContactName.text = contacts[indexPath.row].surname! + " " + contacts[indexPath.row].name!
        cell?.ContactPhoneNumber.text = contacts[indexPath.row].phoneNumber!
        cell?.ContactImageView.image = contacts[indexPath.row].image!
        
        return cell!
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

