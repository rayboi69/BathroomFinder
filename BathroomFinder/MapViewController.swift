//
//  MapViewController.swift
//  BathroomFinder
//
//  Created by Raul Rey Aso on 11/7/14.
//  Copyright (c) 2014 ReyAsoIndustries. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{

    var map: MKMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.map = MKMapView(frame: self.view.bounds)
        
        var currentlat = 41.876189
        var currentlon = -87.627418
        
        var latPin2 = 41.877724
        var lonPin2 = -87.627216
        
        var latPin3 = 41.879724
        var lonPin3 = -87.627216
        
        var latPin4 = 41.875724
        var lonPin4 = -87.626216
        
        var latPin5 = 41.876189
        var lonPin5 = -87.629
        
        
        var location = CLLocationCoordinate2D(latitude: currentlat, longitude: currentlon)
        var span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        var region = MKCoordinateRegion(center: location, span: span)
        
        self.map?.setRegion(region, animated: true)
        self.view = self.map!
        
        
        var pin2 = MKPointAnnotation()
        pin2.title = "Rey's Corner"
        pin2.subtitle = "Available - $1 Per Minute"
        pin2.coordinate.latitude = latPin2
        pin2.coordinate.longitude = lonPin2
        
        var pin3 = MKPointAnnotation()
        pin3.title = "Katie's Castle"
        pin3.subtitle = "In Use - $5 Per Minute"
        pin3.coordinate.latitude = latPin3
        pin3.coordinate.longitude = lonPin3
        
        var pin4 = MKPointAnnotation()
        pin4.title = "Ricky O Potty"
        pin4.subtitle = "Available - $3 Per Minute"
        pin4.coordinate.latitude = latPin4
        pin4.coordinate.longitude = lonPin4
        
        var pin5 = MKPointAnnotation()
        pin5.title = "Casa de Gopi"
        pin5.subtitle = "In Use - $10 Per Minute"
        pin5.coordinate.latitude = latPin5
        pin5.coordinate.longitude = lonPin5
        
        self.map?.addAnnotation(pin2)
        self.map?.addAnnotation(pin3)
        self.map?.addAnnotation(pin4)
        self.map?.addAnnotation(pin5)
        

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
            
            if (annotation.title == "Ricky O Potty" || annotation.title == "Rey's Corner")
            {
                pinView!.canShowCallout = true
                pinView!.animatesDrop = true
                pinView!.pinColor = MKPinAnnotationColor.Green
                pinView!.rightCalloutAccessoryView  = button
            }
            else if (annotation.title == "Katie's Castle" || annotation.title == "Casa de Gopi")
            {
                pinView!.canShowCallout = true
                pinView!.animatesDrop = true
                pinView!.pinColor = MKPinAnnotationColor.Red
            }
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {

        if (view.annotation.title == "Rey's Corner")
        {
            self.performSegueWithIdentifier("FlowDetail", sender: self)
        }
        else if (view.annotation.title == "Ricky O Potty")
        {
            self.performSegueWithIdentifier("RickyFlowDetail", sender: self)
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
