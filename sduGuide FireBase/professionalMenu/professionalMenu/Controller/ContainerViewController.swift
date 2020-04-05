//
//  ContainerViewController.swift
//  professionalMenu
//
//  Created by Nurbek on 1/21/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    // MARK: - Properties
    var menuVC: MenuViewController!
    var centerVC: UIViewController!
    var isExpanded = false
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }

    // MARK: - Navigation
    /*
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Handlers
    
    func configureHomeController() {
        let homeController = HomeViewController()
        centerVC = UINavigationController(rootViewController: homeController)
        homeController.delegate = self
        view.addSubview(centerVC.view)
        addChild(centerVC)
        centerVC.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuVC == nil {
            menuVC = MenuViewController()
            menuVC.delegate = self
            view.insertSubview(menuVC.view, at: 0)
            addChild(menuVC)
            menuVC.didMove(toParent: self)
            print("added")
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            //show Menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerVC.view.frame.origin.x = self.centerVC.view.frame.width - 80
            }, completion: nil)
        }
        else {
            //hide menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerVC.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        animateStatusBar()
        
    }
    func didSelectMenuOption(menuOption: MenuOption){
        switch menuOption {
        
        case .Profile:
            print("profile")
        case .Posts:
            print("posts")
        case .MyPosts:
            print("myPosts")
        case .LogOut:
            print("logOut")
        }
        
    }
    func animateStatusBar() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
}


    //MARK: - Extensions
extension ContainerViewController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
        
    }
    
}
