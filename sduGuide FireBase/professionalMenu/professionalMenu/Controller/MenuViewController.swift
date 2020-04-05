//
//  MenuViewController.swift
//  professionalMenu
//
//  Created by Nurbek on 1/21/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MenuOptionCell"

class MenuViewController: UIViewController {
    // MARK: - Properties
    
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    
    let userImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        //label.text = "text"
        return label
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        configureTableView()
        configureUserInformations()
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
    func configureUserInformations() {
        userImageView.image = UIImage(named: "stud_photo")
        view.addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.layer.borderWidth = 1
        userImageView.layer.cornerRadius = 40
        userImageView.clipsToBounds = true
        userImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        userImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        
        userNameLabel.text = "Nurbek Tuleugaliyev"
        view.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 5).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true
        
    }
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        tableView.backgroundColor = .darkGray
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor ).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor ).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ,constant: 100).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor ).isActive = true
    }
}

//MARK: - Extensions

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.imageView?.image = menuOption?.image
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate!.handleMenuToggle(forMenuOption: menuOption!)
    }
    
    
}
