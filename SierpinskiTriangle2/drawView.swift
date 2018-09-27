//
//  drawView.swift
//  SierpinskiTriangle2
//
//  Created by Vigram Mohan on 27/09/2018.
//  Copyright © 2018 Vigram. All rights reserved.
//

import UIKit
@IBDesignable

class drawView: UIView{


    override func draw(_ rect: CGRect)
    {
        drawFirstTriangle()
        
        let trianglePath = UIBezierPath()
        drawView.drawSierpinskyTriangle(level: 5 , xPoint: self.bounds.width/2, yPoint: self.bounds.width, size: self.bounds.width/2, trianglePath: trianglePath)
    }

    func drawFirstTriangle()
    {
        let xPoint:CGFloat=self.bounds.width/2
        let yPoint:CGFloat=0.0
        let size:CGFloat=self.bounds.width
        
        let p1 = CGPoint(x: xPoint, y: yPoint)
        let p2 = CGPoint(x: xPoint+(size/2), y: yPoint+size)
        let p3 = CGPoint(x: 0.0, y: yPoint+size)
        let trianglePoint = TrianglePoints(p1: p1, p2: p2, p3: p3)
        drawHelpers.drawTriangle(trianglePoint: trianglePoint, fill: UIColor.black)
        
    }
    
    
    static func drawSierpinskyTriangle(level : Int, xPoint : CGFloat, yPoint : CGFloat, size : CGFloat, trianglePath : UIBezierPath)
    {
        if(level <= 0)
        {
            return
        }

        //draw the triangles
        drawHelpers.drawUpsideDownTriangle(xPoint: xPoint, yPoint: yPoint, trianglePath:trianglePath, size: size)
        
        
        //recursively call the function
        drawSierpinskyTriangle(level: level-1, xPoint: xPoint, yPoint: yPoint-size, size: size/2, trianglePath: trianglePath);
        drawSierpinskyTriangle(level: level-1, xPoint: xPoint+size/2, yPoint: yPoint, size: size/2, trianglePath: trianglePath);
        drawSierpinskyTriangle(level: level-1, xPoint: xPoint-size/2, yPoint: yPoint, size: size/2, trianglePath: trianglePath);
    }
    


}
