//
//  ViewController.swift
//  Bottom Sheets
//
//  Created by Gabriel Castillo Serafim on 7/12/22.
//

import UIKit

//MARK: - Bottom Sheets only available on IOS 15

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let button = UIButton()
        button.setTitle("Present BottomSheet", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.addTarget(self, action: #selector(presentBottomSheet), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 52).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let topButton = UIButton()
        topButton.setTitle("Expand BottomSheet", for: .normal)
        topButton.backgroundColor = .lightGray
        topButton.titleLabel?.textColor = .white
        topButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        topButton.addTarget(self, action: #selector(expandBottomSheet), for: .touchUpInside)
        view.addSubview(topButton)
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        topButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        topButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        topButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    //Create an instance of the viewController that we want to present (Very important to create a global instance of the view controller to present because if we want to enable interaction on the background of the action sheet such as in the expandBottomSheet function we must pass in the same reference as the view controller that is being modified.)
    let nextVC = SecondViewController()
    
    @objc func presentBottomSheet() {
        
        //Create an sheet property
        if let sheet = nextVC.sheetPresentationController {
            
            sheet.detents = [.medium(), .large()] //This sets the sheet to be able to adopt a medium and large size
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false //This enables user to scroll on tableviews and scrollable view without setting the sheet size to large
            sheet.prefersGrabberVisible = true //This enables a default grabber to the top of the sheet
            sheet.preferredCornerRadius = 25 //This changes the default corner radius of the sheet
            sheet.largestUndimmedDetentIdentifier = .medium //This changes the default behaviour of dismissing the sheet whenever user touched outside to allow user interaction with background view wile sheet is presented.
        }
            
        self.present(nextVC, animated: true)
    }
    
    @objc func expandBottomSheet() {
        
        if let sheet = nextVC.sheetPresentationController {
            //Here we are setting the size of the bottom sheet to be large when this button that is in the background view gets touched.
            sheet.animateChanges {
                sheet.selectedDetentIdentifier = .large
            }
        }
    }
}



class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
    }
}
