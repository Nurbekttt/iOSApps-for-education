//
//  Rectangle.swift
//  drawing
//
//  Created by Nurbek on 9/29/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation
import UIKit

class Rectangle:Shape {
    private var p1: CGPoint
    private var p2: CGPoint
    internal var color: UIColor
    private var stroke_width: CGFloat = 0.0
    private var isFilled: Bool
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool) {
        self.color = color
        self.p1 = p1
        self.p2 = p2
        self.stroke_width = stroke_width
        self.isFilled = isFilled
    }
    func drawPath() {
        let rect = CGRect(origin: p1,
                          size: CGSize(width: abs(p1.x-p2.x), height: abs(p1.y-p2.y)))
        let path = UIBezierPath(rect: rect)
        color.set()
        path.lineWidth = stroke_width
        (isFilled) ? path.fill() : path.stroke()
        
    }
}
