//
//  clubsViewController.swift
//  sduGuide
//
//  Created by Nurbek on 10/25/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class clubsViewController: UIViewController {
    let transiton = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuTableViewController") else {return}
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    
    
}
extension clubsViewController: UIViewControllerTransitioningDelegate {
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

