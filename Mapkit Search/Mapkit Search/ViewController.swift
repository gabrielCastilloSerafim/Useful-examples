//
//  ViewController.swift
//  Mapkit Search
//
//  Created by Gabriel Castillo Serafim on 6/12/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    private var _view = View()
    
    override func loadView() {
        super.loadView()
        
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _view.searchBar.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        _view.searchBar.endEditing(true)
    }

}

//MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //Ignoring user interaction
        _view.isUserInteractionEnabled = false
        
        //Present activity indicator
        _view.activityIndicator.startAnimating()
        
        //Create the search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { response, error in
            
            guard let response = response else { return }
            
            //Getting data
            let latitude = response.boundingRegion.center.latitude
            let longitude = response.boundingRegion.center.longitude
            
            //Create and add annotation to map
            let annotation = MKPointAnnotation()
            annotation.title = searchBar.text
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            self._view.mapView.addAnnotation(annotation)
            
            //Dismiss activityIndicator and reenable user interaction
            self._view.activityIndicator.stopAnimating()
            self._view.isUserInteractionEnabled = true
        
            //Zoom in our annotation
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1) //Represents how much do we want to be zoomed in on the coordinates
            let region = MKCoordinateRegion(center: coordinate, span: span)
            self._view.mapView.setRegion(region, animated: true)
            
            
        }
        
    }
    
}
