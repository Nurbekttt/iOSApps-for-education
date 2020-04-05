//
//  Segue.swift
//  animation
//
//  Created by Nurbek on 11/17/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class Segue: UIStoryboardSegue {
    override func perform() {
        let destView = self.destination.view
        
        
        destView?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        destView?.clipsToBounds = true
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
            
            self.source.present(self.destination, animated: true){
                destView?.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            })
        }
    }


