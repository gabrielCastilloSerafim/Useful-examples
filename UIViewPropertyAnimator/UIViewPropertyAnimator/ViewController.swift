//
//  ViewController.swift
//  UIViewPropertyAnimator
//
//  Created by Gabriel Castillo Serafim on 5/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    //Create a animator property
    let animator = UIViewPropertyAnimator(duration: 3, curve: .linear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInitialSetup()
        addEndAnimations()
        animator.startAnimation(afterDelay: 1)
    }
    
    //Configure the initial state for the item to animate
    private func configureInitialSetup() {
        image.alpha = 0
        image.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    }
    
    //Configure the final state of the animation for the item to animate
    private func addEndAnimations() {
        
        //Add the scale and alpha animations
        animator.addAnimations {
            self.image.alpha = 1
            self.image.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
        
        //Add the move down animation and set it to start occurring when the animation's progress reaches 50%
        animator.addAnimations({
            self.image.frame.origin.y += 250
        }, delayFactor: 0.5)
    }
}

