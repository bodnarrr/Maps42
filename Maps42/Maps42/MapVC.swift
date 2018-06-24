//
//  MapVC.swift
//  Maps42
//
//  Created by Andriy BODNAR on 6/2/18.
//  Copyright © 2018 Andriy BODNAR. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    
    let initialLocation = CLLocationCoordinate2D(latitude: 50.468830, longitude: 30.462230)
    let regionRadius: CLLocationDistance = 1000
    let allPlaces = AllPlases()
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.mapType = .hybrid
        segmentControl.selectedSegmentIndex = 2
        
        centerMapOnLocation(location: initialLocation)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        setDefaultPins()
    }
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func setDefaultPins() {
        for place in allPlaces.places {
            mapView.addAnnotation(place)
        }
    }
    
    @IBAction func segmentedControllTapped(_ sender: UISegmentedControl) {
        
        let segIndex = segmentControl.selectedSegmentIndex
        if (segIndex == 0) {
            mapView.mapType = .standard
        } else if (segIndex == 1) {
            mapView.mapType = .satellite
        } else {
            mapView.mapType = .hybrid
        }
    }
    
    @IBAction func userLocationBtnTapped(_ sender: UIButton) {
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
}

extension MapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Place else { return nil }
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.rightCalloutAccessoryView = UIButton(type: .custom)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        centerMapOnLocation(location : (view.annotation?.coordinate)!)
    }
}

extension MapVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        manager.stopUpdatingLocation()
        
        let center = userLocation.coordinate
        let span = MKCoordinateSpanMake(0.2, 0.2)
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
    }
}
