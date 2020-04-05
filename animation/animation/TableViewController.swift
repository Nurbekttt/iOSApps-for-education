//  bismillah
//  TableViewController.swift
//  animation
//
//  Created by Nurbek on 11/17/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var myTableView: UITableView!
    var phones=[Phone.init("iPhone 7plus", "350$", "Snapdragon 800", "12 MPX"),Phone.init("Samsung S8", "500$", "Snapdragon 880", "24 MPX"),Phone.init("HTC One M9", "500$", "Snapdragon 700", "20 MPX"),Phone.init("LG G4", "300$", "Snapdragon 600", "12 MPX")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phones.count
    }

    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? TableViewCell
        cell?.index = indexPath
        cell?.name.text = phones[indexPath.row].name
        cell?.price.text = phones[indexPath.row].price
        cell?.processor.text = phones[indexPath.row].processor
        cell?.pixel.text = phones[indexPath.row].pixel
        
        // Configure the cell...

        return cell!
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TableViewController: UIViewControllerTransitioningDelegate{
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return AnimationController()
    }
    
}
