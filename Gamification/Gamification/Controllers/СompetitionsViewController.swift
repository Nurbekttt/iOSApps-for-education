//
//  СompetitionsViewController.swift
//  Gamification
//
//  Created by Nurbek on 3/27/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import UIKit

class CompetitionsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var challengeList = [ChallengeModel.init(name: "Ramazan 30 day challenge", state: "Тегін", ratingForStars: "4.5", rating: "192/201", price: "Тегін")]
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 172, height: 172)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        cell.widthAnchor.constraint(equalToConstant: 172).isActive = true
        cell.heightAnchor.constraint(equalToConstant: 172).isActive = true
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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

}
