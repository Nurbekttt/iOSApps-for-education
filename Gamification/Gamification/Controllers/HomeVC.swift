//
//  homeVC.swift
//  Gamification
//
//  Created by Nurbek on 3/10/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var BottomView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var paryzView: UIView!
    @IBOutlet weak var sunnetView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var toDoListForToday = [ToDoModel.init(toDo: "Видео қарау", isDone: false, hasLink: true, link: "https://www.youtube.com/watch?v=H5bEUc72TuE"), ToDoModel.init(toDo: "Ораза", isDone: true, hasLink: false, link: ""), ToDoModel.init(toDo: "Кәлимә таухид 100 рет", isDone: false, hasLink: true, link: "https://www.google.com/")]
    var namazdar = ["tangP", "besinP", "ekintiP", "shamP", "quptanP","utir", "tangS", "besinS", "shamS", "ekintiS", "quptanS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
            return
        }
        print(deviceID)
        // Do any additional setup after loading the view.
        configureView()
        
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if traitCollection.userInterfaceStyle == .light {
//            print("Light mode")
//        } else {
//            print("Dark mode")
//        }
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListForToday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDo") as? ToDoTableViewCell
        cell?.whatToDoLabel.text = toDoListForToday[indexPath.row].toDo
        cell?.hasLink = toDoListForToday[indexPath.row].hasLink

        if toDoListForToday[indexPath.row].isDone! {
            cell?.isDoneButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
        else {
            cell?.isDoneButton.backgroundColor = .white
        }
        
        cell?.isDoneButton.layer.cornerRadius = 12.5
        cell?.isDoneButton.layer.shadowRadius = 5
        cell?.isDoneButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        cell?.isDoneButton.layer.shadowOpacity = 0.7
        return cell!
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let row = indexPath.row
//        print("Row: \(row)")
//
//        print(toDoListForToday[row])
//
//        let webViewController = self.storyboard!.instantiateViewController(withIdentifier: "webVC") as! WebViewController
//        webViewController.header = toDoListForToday[row].toDo
//        webViewController.link = toDoListForToday[row].link
//
//        present(webViewController, animated: true, completion: nil)
//
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            if self.toDoListForToday[indexPath.row].hasLink! {
                let webViewController = self.storyboard!.instantiateViewController(withIdentifier: "webVC") as! WebViewController
                webViewController.header = self.toDoListForToday[indexPath.row].toDo
                webViewController.link = self.toDoListForToday[indexPath.row].link
                
                self.present(webViewController, animated: true, completion: nil)
                self.tableView.cellForRow(at: indexPath)?.isSelected = false
            }
        }
    }
    
    func configureView() {
        self.tabBarItem.image = UIImage(named: "home-1")
        
        TopView.backgroundColor = TopView.backgroundColor!.withAlphaComponent(0.4)
        TopView.layer.cornerRadius = 20
        BottomView.backgroundColor = BottomView.backgroundColor!.withAlphaComponent(0.4)
        BottomView.layer.cornerRadius = 20
        
        paryzView.translatesAutoresizingMaskIntoConstraints = false
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        
        
        paryzView.centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor).isActive = true
        paryzView.centerXAnchor.constraint(equalTo: TopView.rightAnchor, constant: -(screenWidth-280)/10-50).isActive = true
        
        sunnetView.translatesAutoresizingMaskIntoConstraints = false
        sunnetView.centerYAnchor.constraint(equalTo: buttons[10].centerYAnchor).isActive = true
        sunnetView.centerXAnchor.constraint(equalTo: TopView.rightAnchor, constant: (-(screenWidth-275)*3)/8-105).isActive = true
        
        for button in buttons {
            button.layer.cornerRadius = 12.5
            
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            button.layer.shadowOpacity = 0.7
        }
        
        
        

    }

    @IBAction func topViewButtondClicked(_ sender: UIButton) {
        for (index, i) in buttons.enumerated() {
            if i==sender {
                if sender.backgroundColor == UIColor.white {
                    sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                    print(namazdar[index]+" done")
                }
                else {
                    sender.backgroundColor = .white
                    print(namazdar[index]+" in process")
                }
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        print("any")
//        if let navbar = segue.destination as? UINavigationController{
//            if let destination = navbar.visibleViewController as? WebViewController {
//                let index = (tableView.indexPathForSelectedRow?.row)!
//                print(index)
//                destination.link = toDoListForToday[index].link
//                destination.header = toDoListForToday[index].toDo
//            }
//        }
//    }
    

}
