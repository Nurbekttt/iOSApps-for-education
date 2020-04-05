//
//  SettingsViewController.swift
//  Gamification
//
//  Created by Nurbek on 3/27/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var backgroundViewOfLocation: UIView!
    var backgroundViewOfCommunication: UIView!
    var settingsTableView: UITableView!
    
    private let locationManager = LocationManager()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingsSection(rawValue: section) else { return 0 }
        switch section {
        case .Location: return LocationOptions.allCases.count
        case .Communications: return CommunicationOptions.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        
        print("Section is \(section)")
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.text = SettingsSection(rawValue: section)?.description
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingsTableViewCell()
        
        guard let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .Location:
            let location = LocationOptions(rawValue: indexPath.row)

            cell.sectionType = location
        case .Communications:
            let communications = CommunicationOptions(rawValue: indexPath.row)
            cell.sectionType = communications
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = SettingsSection(rawValue: indexPath.section) else { return }
        
        switch section {
        case .Location:
            print(LocationOptions(rawValue: indexPath.row)?.description as Any)
        case .Communications:
            print(CommunicationOptions(rawValue: indexPath.row)?.description as Any)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        self.setCurrentLocation()
        // Do any additional setup after loading the view.
    }
    
    private func setCurrentLocation() {
        
        guard let exposedLocation = self.locationManager.exposedLocation else {
            print("*** Error in \(#function): exposedLocation is nil")
            return
        }
        
        self.locationManager.getPlace(for: exposedLocation) { placemark in
            guard let placemark = placemark else { return }
            
            var output = "Our location is:"
            if let country = placemark.country {
                output = output + "\n\(country)"
            }
            if let state = placemark.administrativeArea {
                output = output + "\n\(state)"
            }
            if let town = placemark.locality {
                output = output + "\n\(town)"
            }
            print(output)
        }
    }
    
    func configureView() {
        backgroundViewOfLocation = UIView()
        
       view.addSubview(backgroundViewOfLocation)
        backgroundViewOfLocation.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewOfLocation.topAnchor.constraint(equalTo: view.topAnchor, constant: 107).isActive = true
        backgroundViewOfLocation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        backgroundViewOfLocation.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        backgroundViewOfLocation.heightAnchor.constraint(equalToConstant: CGFloat(LocationOptions.allCases.count * 55)).isActive = true
        backgroundViewOfLocation.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        backgroundViewOfLocation.layer.cornerRadius = 20
        
        backgroundViewOfCommunication = UIView()
         
        view.addSubview(backgroundViewOfCommunication)
         backgroundViewOfCommunication.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewOfCommunication.topAnchor.constraint(equalTo: backgroundViewOfLocation.bottomAnchor, constant: 40).isActive = true
         backgroundViewOfCommunication.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
         backgroundViewOfCommunication.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
         backgroundViewOfCommunication.heightAnchor.constraint(equalToConstant: CGFloat(CommunicationOptions.allCases.count * 55)).isActive = true
        backgroundViewOfCommunication.backgroundColor = UIColor.white.withAlphaComponent(0.7)
         backgroundViewOfCommunication.layer.cornerRadius = 20
        
        
        settingsTableView = UITableView()
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        settingsTableView.isScrollEnabled = false
        settingsTableView.rowHeight = 55
        settingsTableView.backgroundColor = UIColor.clear
        settingsTableView.separatorStyle = .none
        
        view.addSubview(settingsTableView)
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        settingsTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        settingsTableView.topAnchor.constraint(equalTo: view.topAnchor ,constant: 67).isActive = true
        settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor ).isActive = true
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
