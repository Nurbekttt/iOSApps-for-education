//
//  ProfileViewController.swift
//  SDUHelper
//
//  Created by Nurbek on 12/23/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    
      
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var studentIdLabel: UILabel!
    @IBOutlet weak var advisorLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    let transiton = SlideInTransition()
    
      override func viewDidLoad() {
        super.viewDidLoad()
        roundedImage()
        fullName.text = currentUser?.fullName
        emailLabel.text = currentUser?.email
        specialityLabel.text = currentUser?.speciality
        studentIdLabel.text = currentUser?.studentID
        advisorLabel.text = currentUser?.advisor
        birthdayLabel.text = currentUser?.birthDay
        
        let url = URL(string: currentUser!.linkOfPhoto)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        photo.image = UIImage(data: data!)
        
          // Do any additional setup after loading the view.
      }

      func roundedImage() {
          photo.layer.cornerRadius = (photo.frame.size.width) / 2;
          photo.clipsToBounds = true
          photo.layer.borderWidth = 2.0
          photo.layer.borderColor = UIColor.white.cgColor
      }
    @IBAction func didMenuPressed(_ sender: Any) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuTableViewController") else {return}
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    
    }
      func roundedTextField(_ corners: UIRectCorner, radius: CGFloat, view: UIView) {
             let mask = CAShapeLayer()
             mask.bounds = view.frame
             mask.position = view.center
             mask.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
             view.layer.mask = mask
         }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ProfileViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if(transiton.isPresenting){
            transiton.isPresenting = false
        }
        else{
            transiton.isPresenting = true
        }
        return transiton
    }
    
    
}
