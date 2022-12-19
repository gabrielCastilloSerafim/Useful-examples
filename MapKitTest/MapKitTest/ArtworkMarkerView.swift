//
//  ArtworkMarkerView.swift
//  MapKitTest
//
//  Created by Gabriel Castillo Serafim on 6/12/22.
//

import Foundation
import MapKit

//MARK: - Use this class when need to change the annotation color / icon

class ArtworkMarkerView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        
        willSet {
            //Configuration
            guard let artwork = newValue as? Artwork else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            //Change the tint color according to the tint color got from the Artwork model, and also replace it's pin icon with the first letter of annotation's discipline
            markerTintColor = artwork.markerTintColor
            glyphImage = artwork.image
//            if let letter = artwork.discipline?.first {
//                glyphText = String(letter)
//            }
        }
    }
}

//MARK: - Use this class when need to change the annotation to be an image instead of a pin

class ArtworkView: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        
        willSet {
            guard let artwork = newValue as? Artwork else { return }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            image = artwork.image
        }
    }
}
