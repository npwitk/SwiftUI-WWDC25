//
//  PlaygroundMacro.swift
//  SwiftUI-WWDC25
//
//  Created by Nonprawich I. on 22/6/25.
//

import MapKit
import Playgrounds
import SwiftUI

#Playground {
    let coordinate = CLLocationCoordinate2D(
        latitude: 14.07728,
        longitude: 100.59560
    )
    
    
    let region = MKCoordinateRegion(
        center: coordinate,
        latitudinalMeters: 150,
        longitudinalMeters: 150
    )
}
