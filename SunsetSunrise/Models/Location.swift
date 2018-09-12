//
//  Location.swift
//  SunsetSunrise
//
//  Created by Kolos on 9/11/18.
//  Copyright © 2018 Kolos. All rights reserved.
//

import Foundation
import CoreLocation


class LocationCoordinates {
    let longitude: Double
    let latitude: Double
    
    init(locationMenager: CLLocationManager) {
        locationMenager.requestLocation()
        guard let location = locationMenager.location else {
            self.longitude = 0
            self.latitude = 0
            return
        }
        self.longitude = location.coordinate.longitude
        self.latitude = location.coordinate.latitude
    }
    
    init(location: Location) {
        self.latitude = location.lat
        self.longitude = location.lng
    }
    
    init(long: Double, lut: Double) {
        self.longitude = long
        self.latitude = lut
    }
}
