//
//  View.swift
//  CoreAnimations
//
//  Created by Gabriel Castillo Serafim on 5/12/22.
//

import UIKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.addSublayer(animatedLayer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: animateMovement)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: animateOpacity)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var animatedLayer: CALayer = {
       
        let layer = CALayer()
        layer.backgroundColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        
        return layer
    }()
    
    private func animateMovement() {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: animatedLayer.frame.origin.x + (animatedLayer.frame.size.width/2),
                                      y: animatedLayer.frame.origin.y + (animatedLayer.frame.size.height/2))
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animatedLayer.add(animation, forKey: nil)
        
    }
    
    private func animateOpacity() {
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animatedLayer.add(animation, forKey: nil)
        
    }
    
}
