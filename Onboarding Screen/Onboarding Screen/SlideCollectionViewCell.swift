//
//  SlideCollectionViewCell.swift
//  Onboarding Screen
//
//  Created by Gabriel Castillo Serafim on 6/12/22.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        
        contentView.addSubview(imageView)
        
        setupStackView()
    }
    
    private func setupStackView() {
        
        let stackView = UIStackView(arrangedSubviews: [label1,label2])
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 16
        self.addSubview(stackView)
        
        //stackView Constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        //imageView Constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20)
        ])
    }
    
    var imageView: UIImageView = {
       
        let image = UIImageView()
        
        return image
    }()
    
    var label1: UILabel = {
       
        let label = UILabel()
        label.text = "Quick delivery at your doorstep"
        label.font = UIFont.systemFont(ofSize: 31, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    var label2: UILabel = {
       
        let label = UILabel()
        label.text = "Home delivery and online reservation system for restaurants and cafés"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
}
