//
//  ViewController.swift
//  MapKitTest
//
//  Created by Gabriel Castillo Serafim on 5/12/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    private var _view = View()
    
    private var artworks: [Artwork] = []
    
    
    override func loadView() {
        super.loadView()
        
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate and reusable identifier for the annotation view
        _view.mapView.delegate = self
        _view.mapView.register(ArtworkView.self, forAnnotationViewWithReuseIdentifier:MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        //MARK: - Uncomment following line to show a different style of annotation view from a different class on the ArtworkMarkerView file
//        _view.mapView.register(ArtworkMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        // Set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        //Call the extension method the we created to display the initialLocation created above as the center location of the map when the view loads
        _view.mapView.centerToLocation(initialLocation)
        
        //Create a location variable for the center of the island to later on use as the center of our region variable
        let oahuCenter = CLLocation(latitude: 21.4765, longitude: -157.9647)
        
        //Region constant is going to be used as a delimitation rectangle that the user is allowed to navigate
        let region = MKCoordinateRegion( center: oahuCenter.coordinate, latitudinalMeters: 50000, longitudinalMeters: 60000)
        
        //Set the created delimitation
        _view.mapView.setCameraBoundary( MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        //Constant that defines the amount of zoom that the user is allowed to use
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        
        //Set the zoom range
        _view.mapView.setCameraZoomRange(zoomRange, animated: true)
        
        
        //MARK: - The commented code is how to create and add an annotation to the map manually
//        // Show artwork on map
//        let artwork = Artwork(title: "King David Kalakaua", locationName: "Waikiki Gateway Park", discipline: "Sculpture", coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        
//
//        _view.mapView.addAnnotation(artwork)
        
        //Load the geoJSON data from our local file and populate the artworks array
        loadInitialData()
        
        //Populate the mapView with annotations using the artworks array
        _view.mapView.addAnnotations(artworks)
    }
    
    private func loadInitialData() {
        //Access the data form our local geoJSON file
        guard let fileName = Bundle.main.url(forResource: "PublicArt", withExtension: "geojson"),
              let artworkData = try? Data(contentsOf: fileName)
        else { return }
        
        do {
            //Decode our geoJSON file into features as MKGeoJSONFeature, compact map will generate an array with no nil objects
            let features = try MKGeoJSONDecoder().decode(artworkData).compactMap { $0 as? MKGeoJSONFeature }
            //Create artwork objects array using the initialiser from the Artwork model
            let validWorks = features.compactMap(Artwork.init)
            //Append the objects to the local artworks array
            artworks.append(contentsOf: validWorks)
            
        } catch {
            print("Unexpected error: \(error).")
        }
    }

    
}

//MARK: - MapKit View

private extension MKMapView {
    
    //Function that takes a location and a regionRadius and set the mapView to appear on the given location using a CLLocation property and a CLLocationDistance that determine the "amount of zoom that for the given location", we set a default distance of 1000 to the CLLocationDistance which means that if we don't specify a CLLocationDistance the function will user the default value of 1000.
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        
        let coordinateRegion = MKCoordinateRegion( center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
    
}

//MARK: - MapKit View Delegate

extension ViewController: MKMapViewDelegate {
    
//    //This function is like the tableView(_:cellForRowAt:) where we need to dequeue a reusable cell but here we need to dequeue a reusable annotation view
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        
//        //Check that this annotation is an Artwork object. If it isn’t, return nil to let the map view use its default annotation view.
//        guard let annotation = annotation as? Artwork else { return nil }
//        
//        // 3
//        var view: MKMarkerAnnotationView
//        
//        // 4
//        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "artwork") as? MKMarkerAnnotationView {
//            
//            dequeuedView.annotation = annotation
//            view = dequeuedView
//            
//        } else {
//            // 5
//            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "artwork")
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//        return view
//    }
    
    //This method performs a action when the "I" button next to the detailed view is tapped
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let artwork = view.annotation as? Artwork else { return }
        
        //This launch with options dictionary allows us to specify a option to when the maps app get launched to show driving directions the user's current location to the selected location
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        
        //Opens map app with the mapItem property from the artwork model
        artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }
    
}

