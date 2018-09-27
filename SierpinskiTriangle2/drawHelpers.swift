//
//  drawHelpers.swift
//  SierpinskiTriangle2
//
//  Created by Vigram Mohan on 27/09/2018.
//  Copyright © 2018 Vigram. All rights reserved.
//

import UIKit

class drawHelpers: UIView {

    static func drawUpsideDownTriangle(xPoint: CGFloat, yPoint: CGFloat, trianglePath: UIBezierPath, size: CGFloat)
    {
        trianglePath.move(to: CGPoint(x: xPoint, y: yPoint))
        // Add line to Bottom Right
        trianglePath.addLine(to: CGPoint(x: xPoint+(size/2), y: yPoint-size))
        // Add line to Bottom Left
        trianglePath.addLine(to: CGPoint(x: xPoint-(size/2), y: yPoint-size))
        // Complete path by drawing path to the Top
        trianglePath.addLine(to: CGPoint(x: xPoint, y: yPoint))
        
        // fill
        let fillColor = UIColor.white
        fillColor.setFill()
        
        // stroke
        trianglePath.lineWidth = 0.5
        let strokeColor = UIColor.black
        strokeColor.setStroke()
        
        // fill and stroke the path 
        trianglePath.fill()
        trianglePath.stroke()
        
    }
    
    static func drawTriangle(trianglePoint: TrianglePoints, fill: UIColor)
    {
        // Create path for drawing a triangle
        let trianglePath = UIBezierPath()
        
        trianglePath.move(to: trianglePoint.p1)
        
        // Add line to Bottom Right
        trianglePath.addLine(to: trianglePoint.p2)
        // Add line to Bottom Left
        trianglePath.addLine(to: trianglePoint.p3)
        // Complete path by drawing path to the Top
        trianglePath.addLine(to: trianglePoint.p1)
        
        // fill
        let fillColor = fill
        fillColor.setFill()
        
        // stroke
        trianglePath.lineWidth = 0.5
        let strokeColor = UIColor.black
        strokeColor.setStroke()
        
        // fill and stroke the path
        trianglePath.fill()
        trianglePath.stroke()
        
    }

}
