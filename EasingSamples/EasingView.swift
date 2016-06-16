//
//  EasingView.swift
//  EasingSamples
//
//  Created by Todd Johnson on 2/26/16.
//  Copyright © 2016 toddjohn. All rights reserved.
//

import UIKit

class EasingView: UIView {

    var easingFunction: ((t: Float) -> (Float))?
    var currentPosition: Float = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }

    override func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        path.lineWidth = 2
        path.lineJoinStyle = CGLineJoin.Round
        path.moveToPoint(CGPoint(x: 1, y: 0))
        path.addLineToPoint(CGPoint(x: 1, y: bounds.size.height - 1))
        path.addLineToPoint(CGPoint(x: bounds.size.width, y: bounds.size.height - 1))
        UIColor.grayColor().setStroke()
        path.stroke()

        let progressPath = UIBezierPath()
        progressPath.lineWidth = 2
        progressPath.lineJoinStyle = .Round
        let width = bounds.size.width * 0.8
        let height = bounds.size.height * 0.8
        let xmargin = bounds.size.width * 0.1
        let ymargin = bounds.size.height * 0.1
        var y = self.easingFunction?(t: 0) ?? 0
        progressPath.moveToPoint(CGPoint(x: xmargin, y: height + ymargin - (height * CGFloat(y))))
        let stepSize = Float(1 / width)
        var t: Float = 0
        while t < self.currentPosition {
            y = self.easingFunction?(t: t) ?? 0
            let x = width * CGFloat(t)
            let screenY = height + ymargin - (height * CGFloat(y))
            progressPath.addLineToPoint(CGPoint(x: xmargin + x, y: screenY))
            t += stepSize
        }
        UIColor.blueColor().setStroke()
        progressPath.stroke()
    }

}
