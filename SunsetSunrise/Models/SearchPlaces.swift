//
//  SearchPlaces.swift
//  SunsetSunrise
//
//  Created by Kolos on 9/11/18.
//  Copyright © 2018 Kolos. All rights reserved.
//

import Foundation


class SearchPlaces {
    
    static let shared = SearchPlaces()
    
    let key = "AIzaSyATmJrmL0nLUp5uZvzzCeZLV7nWIE1yvFw"
    
    func search(text: String, onComplition: @escaping (LocationCoordinates?, _ error: Bool) -> ()) {
        let strApi = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(text)&key=\(key)"
        guard let strGoogleApi = strApi.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: strGoogleApi)  else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, resopnse, error) in
            if error == nil {
                guard let data = data else {
                    return
                }
                
                guard let result = try? JSONDecoder().decode(GooglePlace.self, from: data) else {
                    print("Error: Couldn't parse json")
                    return
                }
                guard let location = result.results.first?.geometry.location else {
                    onComplition(nil, true)
                    return
                }
                onComplition(LocationCoordinates(location: location), false)
                
            } else {
                //we have error connection google api
            }
        }
        task.resume()
    }
}
