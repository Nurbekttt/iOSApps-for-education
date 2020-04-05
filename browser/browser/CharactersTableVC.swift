//
//  CharactersTableVC.swift
//  browser
//
//  Created by Nurbek on 10/6/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class CharactersTableVC: UITableViewController {
//    func addFavorite(website: site) {
//        favourites.append(site)
//        tableView.reloadData()
//    }
    
    
    @IBOutlet weak var SC: UISegmentedControl!
    var indexSC = 0
    var tapClicked = false
    var sites: [site] = [site(name: "Google", url: "https://www.google.com/"),site(name: "YouTube", url: "https://www.youtube.com/")]
    var favourites: [site]=[]
    
    
    
    @IBAction func scTapped(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add website", message: "Fill all fields", preferredStyle: .alert)
        
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter name"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Enter url"
            textField.keyboardType = .numberPad
        }
        
        let action1 = UIAlertAction(title: "Add", style: .default) { (action) in
            
            self.sites.append(site(name: alert.textFields![0].text!, url: alert.textFields![1].text!))
            self.tableView.reloadData()
        }
        alert.addAction(action1)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    func deleteAction(at indexPath:IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "delete"){ action,view,completion in
                self.sites.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
            }
        action.title = "🗑"
        action.backgroundColor = .red
        return action
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "websites"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tapClicked {
            
            print(favourites)
            return 1
            
        }
        else{
            indexSC = SC.selectedSegmentIndex
            if indexSC == 0{
                return sites.count
            }
            else if indexSC == 1{
                print(favourites)
                return favourites.count
            }
            else{
                return 0
            }
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        
        indexSC = SC.selectedSegmentIndex
        switch indexSC {
        case 0:
            cell.textLabel?.text = sites[indexPath.row].name
            
            
            return cell
        case 1:
            cell.textLabel?.text = favourites[indexPath.row].name
            
            
            return cell
            
            
        default:
            return UITableViewCell()
        }
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show"{
            if let navbar = segue.destination as? UINavigationController{
                if let destination = navbar.visibleViewController as? browserVC {
                    if let index = tableView.indexPathForSelectedRow{
                        destination.url =  sites[index.row].url!
                        destination.name = sites[index.row].name!
//                     /   destination.delegate = self
                    }
                }
            }
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
