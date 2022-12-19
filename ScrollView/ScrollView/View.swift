//
//  View.swift
//  ScrollView
//
//  Created by Gabriel Castillo Serafim on 5/12/22.
//

import UIKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScrollView() {
        
        let scrollView = UIScrollView()
        self.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        scrollView.addSubview(topButton)
        scrollView.addSubview(bottomButton)
        
        //scrollView Constraints
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        //topButton Constraints
        topButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topButton.heightAnchor.constraint(equalToConstant: 52),
            topButton.widthAnchor.constraint(equalToConstant: 200),
            topButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            topButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        //bottomButton Constraints
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomButton.heightAnchor.constraint(equalToConstant: 52),
            bottomButton.widthAnchor.constraint(equalToConstant: 200),
            bottomButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 900),
            bottomButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    var topButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .blue
        
        return button
    }()
    
    var bottomButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .red
        
        return button
    }()
    
}
