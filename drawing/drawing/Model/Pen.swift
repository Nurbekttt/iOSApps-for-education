//
//  Pen.swift
//  drawing
//
//  Created by Nurbek on 9/30/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation
import UIKit

class Pen: Shape {
    
    private var point1: CGPoint
    private var point2: CGPoint
    internal var color: UIColor
    private var stroke_width: CGFloat
    
    init(point1:CGPoint, point2:CGPoint, color:UIColor, stroke_width:CGFloat) {
        self.point1 = point1
        self.point2 = point2
        self.color = color
        self.stroke_width = stroke_width
    }
    
    func drawPath() {
        let path = UIBezierPath()
        path.move(to: point1)
        path.addLine(to: point2)
        path.lineWidth = stroke_width
        path.close()
        path.stroke()
        color.set()
        
        
    }
}
