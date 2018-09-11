//
//  SunsetSunriseInfoMenager.swift
//  SunsetSunrise
//
//  Created by Kolos on 9/11/18.
//  Copyright © 2018 Kolos. All rights reserved.
//

import Foundation


class SunsetSunriseInfoMenager {
    
    
    
    func getinfo(forLocation location: LocationCoordinates, onSucces: @escaping (SunsetSunrise) -> ()) {
        let url = getURL(location: location)
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error ?? "the error")
            } else {
                if let usableData = data {
                    guard let result = try? JSONDecoder().decode(SunsetSunrise.self, from: usableData) else {
                        print("Error: Couldn't parse json")
                        return
                    }
                    onSucces(result)
                }
            }
        }
        task.resume()
    }
    
    private func getURL(location: LocationCoordinates) -> URL {
        let urlString = "https://api.sunrise-sunset.org/json?lat=\(String(format:"%f", location.latitude))&lng=\(String(format:"%f", location.longitude))&formatted=0"
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        return url
    }
}
