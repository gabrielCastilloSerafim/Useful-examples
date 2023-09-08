//
//  ViewController.swift
//  CollectionViewFadeContainer
//
//  Created by Gabriel Castillo Serafim on 8/9/23.
//

import SwiftUI
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private lazy var filtersCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 90, height: 50)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        collectionView.register(Mycell.self, forCellWithReuseIdentifier: Mycell.reuseId)
        
        return collectionView
    }()
    
    private lazy var containerView: UIView = {
       
        generateCollectionViewLateralFadeContainer(viewControllerViewReference: view)
    }()
    
    // MARK: - Main method:
    /// Warning: To use the container properly don't forget to send the collection that is contained within the container to back by calling "myContainer.sendSubviewToBack(myCollectionView)".
    func generateCollectionViewLateralFadeContainer(viewControllerViewReference: UIView, gradientWidth: CGFloat = 15) -> UIView {
        
        let containerView = UIView()
        let gradientColors = [UIColor.white.cgColor, UIColor.white.withAlphaComponent(0.01).cgColor]
        
        // Right gradient
        let rightImageView = UIImageView()
        let rightGradientLayer = CAGradientLayer()
        rightGradientLayer.frame = viewControllerViewReference.bounds
        rightGradientLayer.colors = gradientColors
        rightGradientLayer.startPoint = CGPoint(x: 1, y: 1)
        rightGradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        UIGraphicsBeginImageContext(rightGradientLayer.bounds.size)
        
        guard let graphicsGetCurrentContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return containerView
        }
        
        rightGradientLayer.render(in: graphicsGetCurrentContext)
        let rightGradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        rightImageView.image = rightGradientImage
        
        // Left gradient
        let leftImageView = UIImageView()
        let leftGradientLayer = CAGradientLayer()
        leftGradientLayer.frame = viewControllerViewReference.bounds
        leftGradientLayer.colors = gradientColors
        leftGradientLayer.startPoint = CGPoint(x: 0, y: 1)
        leftGradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        UIGraphicsBeginImageContext(leftGradientLayer.bounds.size)
        
        guard let graphicsGetCurrentContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return containerView
        }
        
        leftGradientLayer.render(in: graphicsGetCurrentContext)
        let leftGradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        leftImageView.image = leftGradientImage
        
        
        containerView.addSubview(leftImageView)
        containerView.addSubview(rightImageView)
        
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // leftImageView
        NSLayoutConstraint(
            item: leftImageView, attribute: .leading, relatedBy: .equal,
            toItem: containerView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: leftImageView, attribute: .top, relatedBy: .equal,
            toItem: containerView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: leftImageView, attribute: .bottom, relatedBy: .equal,
            toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: leftImageView, attribute: .width, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: gradientWidth).isActive = true
        
        // rightImageView
        NSLayoutConstraint(
            item: rightImageView, attribute: .trailing, relatedBy: .equal,
            toItem: containerView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: rightImageView, attribute: .top, relatedBy: .equal,
            toItem: containerView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: rightImageView, attribute: .bottom, relatedBy: .equal,
            toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: rightImageView, attribute: .width, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: gradientWidth).isActive = true
        
        return containerView
    }
    
    private func setupUI() {
        
        view.addSubview(containerView)
        containerView.addSubview(filtersCollectionView)
        containerView.sendSubviewToBack(filtersCollectionView)
        
        filtersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // containerView
        NSLayoutConstraint(
            item: containerView, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: containerView, attribute: .centerY, relatedBy: .equal,
            toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: containerView, attribute: .leading, relatedBy: .equal,
            toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: containerView, attribute: .trailing, relatedBy: .equal,
            toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: containerView, attribute: .height, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
        
        // filtersCollectionView
        NSLayoutConstraint(
            item: filtersCollectionView, attribute: .top, relatedBy: .equal,
            toItem: containerView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: filtersCollectionView, attribute: .bottom, relatedBy: .equal,
            toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: filtersCollectionView, attribute: .leading, relatedBy: .equal,
            toItem: containerView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: filtersCollectionView, attribute: .trailing, relatedBy: .equal,
            toItem: containerView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Mycell.reuseId, for: indexPath) as? Mycell ?? Mycell()
        
        return cell
    }
}

class Mycell: UICollectionViewCell {
    
    static let reuseId = "gñodsnfgñsodfig"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        let view = UIView()
        view.backgroundColor = .black
        
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: view, attribute: .top, relatedBy: .equal,
            toItem: contentView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: view, attribute: .leading, relatedBy: .equal,
            toItem: contentView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: view, attribute: .trailing, relatedBy: .equal,
            toItem: contentView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: view, attribute: .bottom, relatedBy: .equal,
            toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: view, attribute: .height, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
        
        NSLayoutConstraint(
            item: view, attribute: .width, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 90).isActive = true
    }
}

struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController

    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Nothing here
    }
}

struct ViewPreview: UIViewRepresentable {
    let viewBuilder: () -> UIView

    init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }

    func makeUIView(context: Context) -> some UIView {
        viewBuilder()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Nothing here
    }
}

struct ProfileViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController()
        }
    }
}


