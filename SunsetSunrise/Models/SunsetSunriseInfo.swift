//
//  SunsetSunriseInfo.swift
//  SunsetSunrise
//
//  Created by Kolos on 9/11/18.
//  Copyright © 2018 Kolos. All rights reserved.
//

struct SunsetSunrise: Decodable {
    let results: Results
    let status: String
}

struct Results: Decodable {
    let sunrise: String
    let sunset: String
    let solarNoon: String
    let dayLength: Int
    let civilTwilightBegin: String
    let civilTwilightEnd: String
    let astronomicalTwilightBegin: String
    let astronomicalTwilightEnd: String
    
    enum CodingKeys : String, CodingKey {
        case sunrise
        case sunset
        case solarNoon = "solar_noon"
        case dayLength = "day_length"
        case civilTwilightBegin = "civil_twilight_begin"
        case civilTwilightEnd = "civil_twilight_end"
        case astronomicalTwilightBegin = "astronomical_twilight_begin"
        case astronomicalTwilightEnd = "astronomical_twilight_end"
    }
}

