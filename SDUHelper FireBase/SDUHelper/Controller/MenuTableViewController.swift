//
//  MenuTableViewController.swift
//  SDUHelper
//
//  Created by Nurbek on 11/25/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import FirebaseAuth

class MenuTableViewController: UITableViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    enum MenuType: Int {
        case Profile
        case Problems
        case MyPosts
        case LogOut
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.text = currentUser?.fullName
        let url = URL(string: currentUser!.linkOfPhoto)
               let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
               imageView.image = UIImage(data: data!)
            roundedImage(photo: imageView)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func roundedImage(photo: UIImageView) {
        photo.layer.cornerRadius = (photo.frame.size.width) / 2;
        photo.clipsToBounds = true
        photo.layer.borderWidth = 2.0
        photo.layer.borderColor = UIColor.white.cgColor
        photo.contentMode = .scaleAspectFill
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 3){
            let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
            } catch let signOutError as NSError {
              print ("Error signing out: %@", signOutError)
            }
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else { return }
            
            
             
             vc.modalPresentationStyle = .currentContext
            
            present(vc, animated: false)
            
        } else{
           guard let menuType = MenuType(rawValue: indexPath.row) else { return }
           
           print("Dismissing: \(menuType)")
           guard let vc = storyboard?.instantiateViewController(withIdentifier: "\(menuType)") else { return }
           
           
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .currentContext
           
           present(vc, animated: false)
           
        }
           
           
               
          
       }
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
