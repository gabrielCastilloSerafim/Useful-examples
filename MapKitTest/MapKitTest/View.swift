//
//  View.swift
//  MapKitTest
//
//  Created by Gabriel Castillo Serafim on 5/12/22.
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
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    var mapView: MKMapView = {
        
        let mapView = MKMapView()
        
        return mapView
    }()
}
