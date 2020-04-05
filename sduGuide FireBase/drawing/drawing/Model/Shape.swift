//
//  Shape.swift
//  drawing
//
//  Created by Nurbek on 9/30/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation
import UIKit
protocol Shape {
    var color: UIColor { get } 
    func drawPath()
}
