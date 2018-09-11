//
//  GooglePlacesModel.swift
//  SunsetSunrise
//
//  Created by Kolos on 9/11/18.
//  Copyright © 2018 Kolos. All rights reserved.
//

import Foundation


struct GooglePlace: Decodable {
    let results: [Result]
//    let status: String
}

struct Result: Decodable {
    let geometry: Geometry
}

struct Geometry: Decodable{
    let location: Location
}
struct Location: Decodable{
    let lat: Double
    let lng: Double
}
