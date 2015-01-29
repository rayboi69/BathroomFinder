//
//  ProvideMapViewController.swift
//  BathroomFinder
//
//  Created by Raul Rey Aso on 11/8/14.
//  Copyright (c) 2014 ReyAsoIndustries. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ProvideMapViewController: UIViewController, MKMapViewDelegate {

    var map: MKMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.map = MKMapView(frame: self.view.bounds)
        
        var latitude = 41.877724
        var longitude = -87.627216
        
        
        var location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        var span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        var region = MKCoordinateRegion(center: location, span: span)
        
        self.map?.setRegion(region, animated: true)
        self.view = self.map!
        
        
        var pin = MKPointAnnotation()
        pin.title = "Rey's Corner"
        pin.subtitle = "Available - $1 Per Minute"
        pin.coordinate.latitude = latitude
        pin.coordinate.longitude = longitude
        
        self.map?.addAnnotation(pin)
        self.map?.delegate = self
        
    }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        let reuseId = "pin"
        
        var button = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
        
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        if pinView == nil
        {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            
            if (annotation.title == "Rey's Corner")
            {
                pinView!.canShowCallout = true
                pinView!.animatesDrop = true
                pinView!.pinColor = MKPinAnnotationColor.Green
            }
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }

}
