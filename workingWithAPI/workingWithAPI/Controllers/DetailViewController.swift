//
//  DetailViewController.swift
//  workingWithAPI
//
//  Created by Nurbek on 2/14/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    var nameData: String!
    var descriptionData: String!
    var dateData: String!
    var locationsData: String!
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - Handlers
    func configureView() {
        let labelName = UILabel()
        labelName.text = "Name of holiday"
        labelName.tintColor = .black
        
        let labelDescription = UILabel()
        labelDescription.text = "Description of holiday"
        labelDescription.tintColor = .black
        
        let labelDate = UILabel()
        labelDate.text = "Date of holiday"
        labelDate.tintColor = .black
        
        let labelLocation = UILabel()
        labelLocation.text = "Location of holiday"
        labelLocation.tintColor = .black
        
        let labelNameData = UILabel()
        labelNameData.text = nameData
        labelNameData.tintColor = .black
        
        let labelDescriptionData = UILabel()
        labelDescriptionData.text = descriptionData
        labelDescriptionData.tintColor = .black
        
        let labelDateData = UILabel()
        labelDateData.text = dateData
        labelDateData.tintColor = .black
        
        let labelLocationData = UILabel()
        labelLocationData.text = locationsData
        labelLocationData.tintColor = .black
        
        view.addSubview(labelName)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -190).isActive = true
        labelName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        view.addSubview(labelNameData)
        labelNameData.translatesAutoresizingMaskIntoConstraints = false
        labelNameData.leftAnchor.constraint(equalTo: labelName.rightAnchor, constant: 5).isActive = true
        labelNameData.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        labelNameData.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        labelNameData.numberOfLines = 0
        labelNameData.sizeToFit()
        
        
        view.addSubview(labelDescription)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -190).isActive = true
        labelDescription.topAnchor.constraint(equalTo: labelNameData.bottomAnchor, constant: 10).isActive = true
        
        
        
        
        
        view.addSubview(labelDescriptionData)
        labelDescriptionData.translatesAutoresizingMaskIntoConstraints = false
        labelDescriptionData.leftAnchor.constraint(equalTo: labelDescription.rightAnchor, constant: 5).isActive = true
        labelDescriptionData.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true

        labelDescriptionData.topAnchor.constraint(equalTo: labelNameData.bottomAnchor, constant: 10).isActive = true
        labelDescriptionData.numberOfLines = 0
        labelDescriptionData.sizeToFit()
        
        
        view.addSubview(labelDate)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -190).isActive = true
        labelDate.topAnchor.constraint(equalTo: labelDescriptionData.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(labelDateData)
        labelDateData.translatesAutoresizingMaskIntoConstraints = false
        labelDateData.leftAnchor.constraint(equalTo: labelDescription.rightAnchor, constant: 5).isActive = true
        labelDateData.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true

        labelDateData.topAnchor.constraint(equalTo: labelDescriptionData.bottomAnchor, constant: 10).isActive = true
        labelDateData.numberOfLines = 0
        labelDateData.sizeToFit()
        
        view.addSubview(labelLocation)
        labelLocation.translatesAutoresizingMaskIntoConstraints = false
        labelLocation.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -190).isActive = true
        labelLocation.topAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(labelLocationData)
        labelLocationData.translatesAutoresizingMaskIntoConstraints = false
        labelLocationData.leftAnchor.constraint(equalTo: labelDescription.rightAnchor, constant: 5).isActive = true
        labelLocationData.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true

        labelLocationData.topAnchor.constraint(equalTo: labelDateData.bottomAnchor, constant: 10).isActive = true
        labelLocationData.numberOfLines = 0
        labelLocationData.sizeToFit()
    }
}
