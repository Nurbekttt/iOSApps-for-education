//
//  Circle.swift
//  drawing
//
//  Created by Nurbek on 9/29/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation
import UIKit

class Circle:Shape {
    private var radius: CGFloat = 0.0
    private var circle_center: CGPoint
    internal var color: UIColor
    private var stroke_width: CGFloat = 0.0
    private var isFilled: Bool
    init(with radius: CGFloat,
         and circle_center: CGPoint,
         withSome color:UIColor,
         and stroke_width: CGFloat,
         isFilled: Bool) {
        self.circle_center = circle_center
        self.color = color
        self.radius = radius
        self.isFilled = isFilled
        self.stroke_width = stroke_width
    }
    func drawPath(){
        let path = UIBezierPath(arcCenter: circle_center,                           radius: radius,
                                startAngle: 0,
                                endAngle: 2*Double.pi.cg,
                                clockwise: false)
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? path.fill() : path.stroke()
        
        
    }
    
}
extension Double{
    var cg:CGFloat{
        return CGFloat(self)
    }
}
