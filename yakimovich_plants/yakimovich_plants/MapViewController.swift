//
//  MapView.swift
//  yakimovich_plants
//
//  Created by Depravo on 22.06.2022.
//

import UIKit
import CoreLocation



class MapViewController : UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        //originalTopMargin = topMarginConstraint.constant
       // locationManager.delegate = self
       // locationManager.requestWhenInUseAuthorization()
        //if CLLocationManager.locationServicesEnabled()//
        //{
         //   locationManager.desiredAccuracy = kCLLocationAccuracyBest
         //   locationManager.requestLocation()
        //}
        
    }
}
