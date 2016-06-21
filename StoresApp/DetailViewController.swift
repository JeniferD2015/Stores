//
//  DetailViewController.swift
//  StoresApp
//
//  Created by Jenifer  on 5/20/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailViewController: UIViewController, CLLocationManagerDelegate {
    
    var selectedStore : Store!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var imageFromFirstView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedStore.name!
        imageFromFirstView.image = UIImage(named: selectedStore.image!)

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let latitude: CLLocationDegrees =  selectedStore.latitude!
        let longitude:CLLocationDegrees = selectedStore.longitude!
        
        
        let latDelta:CLLocationDegrees = 0.05
        
        let lonDelta:CLLocationDegrees = 0.05
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = selectedStore.location
        
        annotation.subtitle = selectedStore.address
        
        map.addAnnotation(annotation)
    }
 /*   func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        print(locations)
   
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
