//
//  UILabelExtention.swift
//  SunsetSunrise
//
//  Created by Kolos on 9/11/18.
//  Copyright © 2018 Kolos. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    @IBInspectable
    var adjustsFontSize: Bool {
        get {
            return self.adjustsFontSizeToFitWidth
        }
        set {
            self.adjustsFontSizeToFitWidth = newValue
        }
    }
}
