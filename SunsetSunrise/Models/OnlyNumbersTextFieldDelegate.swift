//
//  OnlyNumbersTextFieldDelegate.swift
//  SunsetSunrise
//
//  Created by Kolos on 9/12/18.
//  Copyright © 2018 Kolos. All rights reserved.
//

import UIKit

class OnlyNumbersTextFieldDelegate: UIViewController, UITextFieldDelegate {

 
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allovedCharacters = CharacterSet(charactersIn: "1234567890.-")
        let characterSet = CharacterSet(charactersIn: string)
        return allovedCharacters.isSuperset(of: characterSet)
    }
    
}
