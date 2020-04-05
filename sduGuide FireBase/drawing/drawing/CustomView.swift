//
//  CustomView.swift
//  drawing
//
//  Created by Nurbek on 9/27/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//

import UIKit

class CustomView: UIView {
    var point1: CGPoint!
    var point2: CGPoint!
    var lastPoint: CGPoint!
    var color: UIColor = .black
    var someB: Bool = false
    var arrOfShapes = [Shape]()
    var swiped = false
    var isFilled: Bool = true
    var img: UIImage!
    
    @IBOutlet weak var circle: UIButton!
    
    @IBOutlet weak var rectangle: UIButton!
    
    @IBOutlet weak var line: UIButton!
    
    @IBOutlet weak var triangle: UIButton!
    
    @IBOutlet weak var pencil: UIButton!
    
    @IBAction func customSwitch(_ sender: UISwitch) {
        isFilled = sender.isOn
    }
    
    @IBAction func undo(_ sender: UIButton) {
        if(arrOfShapes.count>0){
            arrOfShapes.removeLast()
        }
        print(arrOfShapes)
        setNeedsDisplay()
        someB = true
    }
    
    @IBAction func CustomColor(_ sender: UIButton) {
        color = sender.backgroundColor ??
            .gray
        print(color)
        someB = true
        
    }
    
    @IBAction func customPen(_ sender: UIButton) {
        
        img = sender.currentBackgroundImage
        
    }
    
    override func draw(_ rect: CGRect) {
        print(color)
        for i in arrOfShapes{
            i.drawPath()
        }
        if let p1 = point1{
            if !someB {
                if(img == UIImage.init(named: "circle")){
                    
                    let circle = Circle(with: (sqrt(pow(abs(p1.x-point2.x),2)+pow(abs(p1.y-point2.y), 2)))/2.0, and: CGPoint(x: p1.x+(point2.x-p1.x)/2.0 , y: p1.y+(point2.y-p1.y)/2.0), withSome: color, and: 5.0, isFilled: isFilled)
                    arrOfShapes.append(circle)
                    circle.drawPath()
                    
                }
                else if(img == UIImage.init(named: "rectangle")){
                    let rect = Rectangle(p1: p1, p2: point2, color: color, stroke_width: 5.0, isFilled: isFilled)
                    arrOfShapes.append(rect)
                    rect.drawPath()
                }
                else if(img == UIImage.init(named: "line")){
                    let line = Line(point1: p1, point2: point2, color: color, stroke_width: 5.0)
                    arrOfShapes.append(line)
                    line.drawPath()
                    
                }
                else if(img == UIImage.init(named: "triangle")){
                    let triangle = Triangle(point1: p1, point2: point2, color: color, stroke_width: 5.0, isFilled: isFilled)
                    arrOfShapes.append(triangle)
                    triangle.drawPath()
                    
                }
                else if(img == UIImage.init(named: "pen")){
                    if let p = lastPoint{
                        point1 = p
                    }
                    let pen = Pen(point1: p1, point2: point2, color: color, stroke_width: 5.0)
                    arrOfShapes.append(pen)
                    pen.drawPath()
                    
                }
            }
            someB = false
            
            
            
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first{
            point1 = touch.location(in: self)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point2 = touch.location(in: self)
        }
    
        
        setNeedsDisplay()
        

    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(img == UIImage.init(named: "pen")){
            if let touch = touches.first {
                let currentPoint = touch.location(in: self)

                point2 = currentPoint
                lastPoint = point2
            }
            setNeedsDisplay()
            
        }
    }
    
    
    

}
