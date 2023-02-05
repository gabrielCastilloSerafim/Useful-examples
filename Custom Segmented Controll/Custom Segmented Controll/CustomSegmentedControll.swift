//
//  CustomSegmentedControll.swift
//  Custom Segmented Controll
//
//  Created by Gabriel Castillo Serafim on 5/2/23.
//

import UIKit

class WorkAreasSelectionSegmentedControl: UISegmentedControl {
    
    private(set) lazy var radius: CGFloat = bounds.height / 2
    private var segmentInset: CGFloat = 8
    
    override init(items: [Any]?) {
        super.init(items: items)
        selectedSegmentIndex = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        self.backgroundColor = .lightGray
        
        // Configure Background Radius
        self.layer.cornerRadius = self.radius
        self.layer.masksToBounds = true
        
        // Configure Background Border
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor

        // Find selectedImageView
        let selectedImageViewIndex = numberOfSegments
        if let selectedImageView = subviews[selectedImageViewIndex] as? UIImageView
        {
            // Configure selectedImageView Color
            selectedImageView.backgroundColor = .white
            selectedImageView.image = nil
            
            // Configure selectedImageView Inset with SegmentControl
            selectedImageView.bounds = selectedImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            
            // Configure selectedImageView cornerRadius
            selectedImageView.layer.masksToBounds = true
            selectedImageView.layer.cornerRadius = selectedImageView.bounds.height / 2
            
            selectedImageView.layer.removeAnimation(forKey: "SelectionBounds")
        }
       
    }
   
}
