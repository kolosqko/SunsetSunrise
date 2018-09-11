//
//  ViewControllerViewModel.swift
//  SunsetSunrise
//
//  Created by Kolos on 9/11/18.
//  Copyright © 2018 Kolos. All rights reserved.
//

import Foundation

class ViewControllerViewModel {
    let location: LocationCoordinates
    let info: SunsetSunrise
    
    init(location: LocationCoordinates, info: SunsetSunrise) {
        self.info = info
        self.location = location
    }
}
