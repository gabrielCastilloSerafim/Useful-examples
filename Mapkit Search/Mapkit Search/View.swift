//
//  View.swift
//  Mapkit Search
//
//  Created by Gabriel Castillo Serafim on 6/12/22.
//

import UIKit
import MapKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.addSubview(mapView)
        self.addSubview(searchBar)
        self.addSubview(activityIndicator)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        //mapView Constraints
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
        //searchBar Constraints
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        
        //activityIndicator Constraints
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    var mapView: MKMapView = {
        
        let mapView = MKMapView()
        
        return mapView
    }()
    
    var searchBar: UISearchBar = {
       
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search..."
        searchBar.searchTextField.backgroundColor = UIColor(white: 1, alpha: 0.9)
        searchBar.searchBarStyle = .minimal
        
        return searchBar
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.hidesWhenStopped = true
        
        return indicator
    }()
    
}
