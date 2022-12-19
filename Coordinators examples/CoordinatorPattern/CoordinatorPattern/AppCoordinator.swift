//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit
import Combine

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    var childCoordinators = [Coordinator]()
    
    let hasSeenOnboarding = CurrentValueSubject<Bool,Never>(false)
    
    var subscribers = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    //On the appCoordinator which is the first and main coordinator that we call we perform the logic to check if the user has already seen the onboard view, depending on the answer we instantiate the coordinator to present, call its start function, store a reference to the child coordinator in this class and then set the window.rootViewController to be the rootViewController of the coordinator that we just instantiated.
    
    func start() {
        
        setupOnboardingValue()
        
        hasSeenOnboarding.sink { [weak self] hasSeen in
            
            if hasSeen == true {
                
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController
                
            } else {
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: self!.hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController
            }
        }.store(in: &subscribers)
    }
    
    func setupOnboardingValue() {
        
        //Here we get the current value stored in user defaults and send it to subscriber
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) //Default of false
        hasSeenOnboarding.send(value)
        
        //Here we listen for changes in hasSeenOnboarding and saves the data to userDefaults
        hasSeenOnboarding
            .filter({ $0 }) //Filter is here because we only want to save to userDefaults id the value is equal to true
            .sink { value in
                UserDefaults.standard.set(value, forKey: key)
            }.store(in: &subscribers)
    }
    
    
}
