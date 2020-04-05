//
//  Triangle.swift
//  drawing
//
//  Created by Nurbek on 9/30/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import Foundation
import UIKit

class Triangle: Shape {
    private var point1: CGPoint
    private var point2: CGPoint
    internal var color: UIColor
    private var stroke_width: CGFloat
    private var isFilled: Bool
    
    init(point1:CGPoint, point2:CGPoint, color:UIColor, stroke_width:CGFloat, isFilled:Bool) {
        self.point1 = point1
        self.point2 = point2
        self.color = color
        self.stroke_width = stroke_width
        self.isFilled = isFilled
    }
    func drawPath(){
        let path = UIBezierPath()
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: CGPoint(x: point1.x, y: point2.y))
        path.addLine(to: point1)
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? path.fill() : path.stroke()
        
        path.close()
        path.stroke()
        
//        (isFilled) ? path.fill() : path.stroke()
//        color.set()
        
    }
}
