//
//  View.swift
//  Onboarding Screen
//
//  Created by Gabriel Castillo Serafim on 6/12/22.
//

import UIKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        self.backgroundColor = .white
        
        self.addSubview(collectionView)
        self.addSubview(pageControl)
        self.addSubview(button)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        //button Constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        //pageControll Constraints
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -16),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        //collectionView Constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height) * 0.75)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        return collectionView
    }()
    
    var pageControl: UIPageControl = {
    
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = 3
        pageControl.isUserInteractionEnabled = false
        
        return pageControl
    }()
    
    var button: UIButton = {
       
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        return button
    }()
    
}
