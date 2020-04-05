//
//  HomeViewController.swift
//  workingWithAPI
//
//  Created by Nurbek on 2/11/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

/*
 // MARK: - Properties
 // MARK: - Init
 // MARK: - Handlers
 */


import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    var dataTableView: UITableView!
    var searchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.placeholder = "Enter country code"
        return sb
    }()
    var listOfHolidays = [HolidayDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.dataTableView.reloadData()
                self.title = "\(self.listOfHolidays.count) holidays found"
            }
        }
    }
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Finder holidays"
        configureView()
        
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
    func configureView() {
        searchBar.delegate = self
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        dataTableView = UITableView()
        dataTableView.delegate = self
        dataTableView.dataSource = self
        dataTableView.keyboardDismissMode = .onDrag
        view.addSubview(dataTableView)
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
        dataTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dataTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dataTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor ).isActive = true
    }

    
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfHolidays.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.dateData = listOfHolidays[indexPath.row].date.iso
        vc.descriptionData = listOfHolidays[indexPath.row].description
        vc.locationsData = listOfHolidays[indexPath.row].locations
        vc.nameData = listOfHolidays[indexPath.row].name
        self.present(vc, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HolidayTableViewCell()
        cell.nameLabel.text = listOfHolidays[indexPath.row].name
        cell.dateLabel.text = listOfHolidays[indexPath.row].date.iso
        cell.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("aaa")
        guard let searchBarText = searchBar.text else {
            return
        }
        let holidayRequest = HolidayRequest(countryCode: searchBarText)
        holidayRequest.getHoliday { [weak self] result in
            switch result {

            case .success(let holidays):
                print("bbb")
                self?.listOfHolidays = holidays
            case .failure(let error):
                print(error)
            }
        }
    }
}
