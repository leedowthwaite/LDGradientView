//
//  GradientView.swift
//  GradientView
//
//  Created by Lee Dowthwaite on 10/12/2017.
//  Copyright © 2017 Echelon Developments Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

//    enum Direction: CustomStringConvertible {
//
//
//        func description() -> String {
//
//        }
//    }

    @IBInspectable var startColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    @IBInspectable var endColor: UIColor? {
        didSet {
            updateGradient()
        }
    }

    @IBInspectable var angle: CGFloat = 90 {
        didSet {
            updateGradient()
        }
    }

    private var gradient: CAGradientLayer?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        installGradient()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        installGradient()
    }

    // Create a gradient and install it on the layer
    private func installGradient() {
        // if there's already a gradient installed on the layer, remove it
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        let gradient = createGradient()
        self.layer.addSublayer(gradient)
        self.gradient = gradient
    }

    // Update an existing gradient
    private func updateGradient() {
        if let gradient = self.gradient {
            let startColor = self.startColor ?? UIColor.clear
            let endColor = self.endColor ?? UIColor.clear
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            let (start, end) = gradientPointsForAngle(self.angle)
            gradient.startPoint = start
            gradient.endPoint = end
        }
    }

    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    
    private func gradientPointsForAngle(_ angle: CGFloat) -> (CGPoint, CGPoint) {
        // angle is in degrees
        // create vector pointing in direction of angle
        let p0 = pointForAngle(angle + 180)
        let p1 = pointForAngle(angle)
        return (p0, p1)
    }
    
    private func pointForAngle(_ angle: CGFloat) -> CGPoint {
        let radians = angle * .pi / 180.0
        var x = cos(radians)
        var y = sin(radians)
        // extrapolate unit circle point to unit square
        if (fabs(x) > fabs(y)) {
            // extrapolate x to unit length
            x = x > 0 ? 1 : -1
            y = x * tan(radians)
        } else {
            // extrapolate y to unit length
            y = y > 0 ? 1 : -1
            x = y / tan(radians)
        }
        let p = transformToGradientSpace(x: x, y: y)
        return p
    }
    
    private func transformToGradientSpace(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: (x + 1) * 0.5, y: 1.0 - (y + 1) * 0.5)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        // ensure the gradient gets initialized when the view is created in IB
        installGradient()
        updateGradient()
    }
}
