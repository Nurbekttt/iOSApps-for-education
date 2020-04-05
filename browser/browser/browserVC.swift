//
//  browserVC.swift
//  browser
//
//  Created by Nurbek on 10/6/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit
import WebKit
//protocol FavoriteDelegate{
//    func addFavorite(website: site)
//}

class browserVC: UIViewController {
    var name: String = "google"
    var url:String = "https://www.google.com/"
   // var delegate: FavoriteDelegate?
    @IBOutlet weak var webView: WKWebView!
    @IBAction func tapRec(_ sender: UITapGestureRecognizer) {
//        let mainVC = CharactersTableVC()
//        mainVC.favourites.append(site(name: name, url: url))
//
//            view.backgroundColor = .yellow
       // delegate?.addFavorite(website: site)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = name
        if let url1 = URL(string:url){
            webView.load(URLRequest(url:url1 ))
            
        }
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
