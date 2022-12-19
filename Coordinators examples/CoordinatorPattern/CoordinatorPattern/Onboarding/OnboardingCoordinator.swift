//
//  OnboardingCoordinator.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit
import Combine

class OnboardingCoordinator: Coordinator {
    
    
    var rootViewController: UIViewController?
    
    var hasSeenOnboarding: CurrentValueSubject<Bool,Never>
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        
        let onboardingViewController = OnboardingViewController()
        
        rootViewController = onboardingViewController
        
        onboardingViewController.finishedOnboarding = { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
    }
    
}
