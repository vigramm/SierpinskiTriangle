//
//  ViewController.swift
//  SierpinskiTriangle2
//
//  Created by Vigram Mohan on 27/09/2018.
//  Copyright © 2018 Vigram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var zoom: CGFloat = 1.0

    
    

    @IBOutlet weak var zoomOutButton: UIView!
    @IBOutlet weak var zoomInButton: UIView!
    @IBOutlet weak var sierpinskiView: drawView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sierpinskiView.isUserInteractionEnabled = true

        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panView))
        self.sierpinskiView.addGestureRecognizer(panGesture)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func zoomOut(_ sender: Any) {
        zoom=zoom*0.9
        sierpinskiView.transform = CGAffineTransform(scaleX: zoom, y: zoom)
        
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        zoom=zoom*1.1
        sierpinskiView.transform = CGAffineTransform(scaleX: zoom, y: zoom)
        
        
        
//        let trianglePath=UIBezierPath()
//        let originalFrame = self.sierpinskiView.frame
//        drawView.drawSierpinskyTriangle(level: 5 , xPoint: originalFrame.origin.x+originalFrame.width/2, yPoint: originalFrame.origin.y, size: originalFrame.width/2, trianglePath: trianglePath)
//        sierpinskiView.setNeedsDisplay()
        
        
    }
    
    @objc func panView(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.sierpinskiView)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.sierpinskiView)
    }
    
    

}

