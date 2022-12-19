//
//  ViewController.swift
//  Onboarding Screen
//
//  Created by Gabriel Castillo Serafim on 6/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var _view = View()
    private var slides = [OnboardingSlides]()
    private var currentPage = 0 {
        didSet {
            if currentPage == 2 {
                _view.button.setTitle("Get started", for: .normal)
            } else {
                _view.button.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _view.collectionView.delegate = self
        _view.collectionView.dataSource = self
        _view.collectionView.register(SlideCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        _view.button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        slides = [OnboardingSlides(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures.", image: UIImage.init(systemName: "person")!), OnboardingSlides(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: UIImage.init(systemName: "gear")!), OnboardingSlides(title: "Instant world-Wide delivery", description: "Your orders will be delivered instantly irrespective of your location.", image: UIImage.init(systemName: "person.circle")!)]
    }

    
    @objc func nextButtonTapped() {
        
        if currentPage == 2 {
            //perform "get started" logic
            let homeVC = HomeViewController()
            
            self.present(homeVC, animated: true)
            
        } else {
            //Increment the current page value by one
            currentPage += 1
            
            //Create a indexPath
            let indexPath = IndexPath(item: currentPage, section: 0)
            
            //Call the collectionView scrollToItem method and pass the indexPath created above
            _view.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            //Update the currentPage
            _view.pageControl.currentPage = currentPage
        }
        
    }

}

//MARK: - UICollectionViewDelegate / DataSource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SlideCollectionViewCell
        
        let object = slides[indexPath.row]
        
        cell.label1.text = object.title
        cell.label2.text = object.description
        cell.imageView.image = object.image
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        
        currentPage = Int(scrollView.contentOffset.x / width)
        
        _view.pageControl.currentPage = currentPage
    }
    
    
}
