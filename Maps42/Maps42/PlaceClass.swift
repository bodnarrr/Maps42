//
//  PlaceClass.swift
//  Maps42
//
//  Created by Andriy BODNAR on 6/3/18.
//  Copyright © 2018 Andriy BODNAR. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
