//
//  HomeViewController.swift
//  professionalMenu
//
//  Created by Nurbek on 1/21/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    let items = ["Rating","Time"]
    var delegate: HomeControllerDelegate?
    var isSolvedPosts = false
    var postSectionArr = [PostSection(sectionName: "Portal problems", color: .blue), PostSection(sectionName: "AcCatering problems", color: .green)]
    
    lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        sc.layer.cornerRadius = 40
        sc.layer.masksToBounds = true
        sc.selectedSegmentTintColor = #colorLiteral(red: 0.1983633041, green: 0.2818387449, blue: 0.5140810013, alpha: 1)
        sc.backgroundColor = #colorLiteral(red: 0.8684988618, green: 0.8820524812, blue: 0.9211845398, alpha: 1)
        let titleTextForSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let titleTextForNormal = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1499385238, green: 0.21643278, blue: 0.3927447796, alpha: 1)]
        sc.setTitleTextAttributes(titleTextForNormal, for: .normal)
        sc.setTitleTextAttributes(titleTextForSelected, for: .selected)
    
        return sc
    }()
    let isSolvedButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "uncheckedCheckbox").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(stateOfPosts), for: .touchUpInside)
        return button
    }()
    var tableOfPosts: UITableView!
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9600958228, green: 0.9645503163, blue: 0.9819015861, alpha: 1)
        configureView()

        //configureSegmentedControl()
        // Do any additional setup after loading the view.
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
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    @objc func stateOfPosts(){
        if !isSolvedPosts {
            isSolvedButton.setBackgroundImage(#imageLiteral(resourceName: "icons8-checked-checkbox-100").withRenderingMode(.alwaysOriginal), for: .normal)
        }
        else {
            isSolvedButton.setBackgroundImage(#imageLiteral(resourceName: "uncheckedCheckbox").withRenderingMode(.alwaysOriginal), for: .normal)
        }
        isSolvedPosts = !isSolvedPosts
    }
    
    func configureView() {
        // navbar
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.187278837, green: 0.2664331496, blue: 0.4857743979, alpha: 1)
        navigationController?.navigationBar.barStyle = .default
        
        navigationItem.title = "Posts"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(cgColor: #colorLiteral(red: 0.187278837, green: 0.2664331496, blue: 0.4857743979, alpha: 1))]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withTintColor( #colorLiteral(red: 0.1983633041, green: 0.2818387449, blue: 0.5140810013, alpha: 1)).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
        
        // segmentedControl
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20 ).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // isSolvedButton
        view.addSubview(isSolvedButton)
        isSolvedButton.translatesAutoresizingMaskIntoConstraints = false
        isSolvedButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
        isSolvedButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        //tableOfPosts
        tableOfPosts = UITableView()
        tableOfPosts.delegate = self
        tableOfPosts.dataSource = self
        
        //tableOfPosts.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        tableOfPosts.separatorStyle = .none
        
        
        tableOfPosts.backgroundColor = #colorLiteral(red: 0.9600958228, green: 0.9645503163, blue: 0.9819015861, alpha: 1)
        tableOfPosts.rowHeight = 165
        
        view.addSubview(tableOfPosts)
        tableOfPosts.translatesAutoresizingMaskIntoConstraints = false
        tableOfPosts.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        tableOfPosts.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        tableOfPosts.topAnchor.constraint(equalTo: isSolvedButton.bottomAnchor ,constant: 10).isActive = true
        tableOfPosts.bottomAnchor.constraint(equalTo: view.bottomAnchor ).isActive = true
        
      
    }
    
}
extension HomeViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostViewCell()
        cell.layer.cornerRadius = 20
        cell.selectionStyle = .none
        return cell
    }
    
    
}
