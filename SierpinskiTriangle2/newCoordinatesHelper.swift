//
//  newCoordinatesHelper.swift
//  SierpinskiTriangle2
//
//  Created by Vigram Mohan on 27/09/2018.
//  Copyright © 2018 Vigram. All rights reserved.
//

import Foundation
import UIKit

class newCoordinatesHelper: UIView {
    

var originalFrame: CGRect {
    let currentTransform = transform
    transform = .identity
    let originalFrame = frame
    transform = currentTransform
    return originalFrame
}

/// Helper to get point offset from center
func centerOffset(_ point: CGPoint) -> CGPoint {
    return CGPoint(x: point.x - center.x, y: point.y - center.y)
}

/// Helper to get point back relative to center
func pointRelativeToCenter(_ point: CGPoint) -> CGPoint {
    return CGPoint(x: point.x + center.x, y: point.y + center.y)
}

/// Helper to get point relative to transformed coords
func newPointInView(_ point: CGPoint) -> CGPoint {
    // get offset from center
    let offset = centerOffset(point)
    // get transformed point
    let transformedPoint = offset.applying(transform)
    // make relative to center
    return pointRelativeToCenter(transformedPoint)
}

var newTopLeft: CGPoint {
    return newPointInView(originalFrame.origin)
}

var newTopRight: CGPoint {
    var point = originalFrame.origin
    point.x += originalFrame.width
    return newPointInView(point)
}

var newBottomLeft: CGPoint {
    var point = originalFrame.origin
    point.y += originalFrame.height
    return newPointInView(point)
}

var newBottomRight: CGPoint {
    var point = originalFrame.origin
    point.x += originalFrame.width
    point.y += originalFrame.height
    return newPointInView(point)
}
}
