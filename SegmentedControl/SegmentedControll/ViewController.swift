//
//  ViewController.swift
//  SegmentedControll
//
//  Created by Gabriel Castillo Serafim on 19/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    let segmentedControl = UISegmentedControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(segmentedControl)
        
        segmentedControl.insertSegment(withTitle: "White", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Red", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Green", at: 2, animated: true)
        segmentedControl.insertSegment(withTitle: "Blue", at: 3, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(didChangeSegmentedControll), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    @objc func didChangeSegmentedControll() {
        
        switch segmentedControl.selectedSegmentIndex {
            
        case 0:
            view.backgroundColor = .white
        case 1:
            view.backgroundColor = .red
        case 2:
            view.backgroundColor = .green
        default:
            view.backgroundColor = .blue
        }
    }
    
}

