//
//  ViewController.swift
//  SunsetSunrise
//
//  Created by Kolos on 9/11/18.
//  Copyright © 2018 Kolos. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    
    
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var sunsetLabel: UILabel!
    
    @IBOutlet weak var solarNoonLabel: UILabel!
    
    @IBOutlet weak var dayLengthLabel: UILabel!
    
    @IBOutlet weak var civilTwilightBeginsLabel: UILabel!
    
    @IBOutlet weak var civilTwilightEndsLabel: UILabel!
    
    @IBOutlet weak var astronomicalTwilightBeginsLabel: UILabel!
    
    @IBOutlet weak var astronomicalTwilightEndsLabel: UILabel!
    
    let locationMenager = CLLocationManager()
    
    let infoMenager = SunsetSunriseInfoMenager()
    
    var location: LocationCoordinates? {
        didSet {
            guard let location = location else {
                return
            }
            infoMenager.getinfo(forLocation: location, onSucces: { [weak self] (info) in ()
                guard let strongSelf = self else {
                    return
                }
                strongSelf.viewModel = ViewControllerViewModel(location: location, info: info)
            })
        }
    }
    
    var viewModel: ViewControllerViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.setUpViews()
                
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        
        
        locationMenager.requestWhenInUseAuthorization()
        locationMenager.delegate = self
        self.location = LocationCoordinates(locationMenager: locationMenager)
    }
    
    
    private func formateDate(fromString dateString: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = dateFormatter.date(from: dateString) else {
            return ""
        }
        
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        return dateFormatter.string(from: date)
    }


    
    func setUpViews(){
        guard let viewModel = viewModel else {
            return
        }
        longitudeLabel.text = String(format:"%f", viewModel.location.longitude)
        latitudeLabel.text = String(format:"%f", viewModel.location.latitude)
        sunriseLabel.text = formateDate(fromString: viewModel.info.results.sunrise)
        sunsetLabel.text = formateDate(fromString: viewModel.info.results.sunset)
        solarNoonLabel.text = formateDate(fromString: viewModel.info.results.solarNoon)
        dayLengthLabel.text = String(viewModel.info.results.dayLength)
        civilTwilightBeginsLabel.text = formateDate(fromString: viewModel.info.results.civilTwilightBegin)
        civilTwilightEndsLabel.text = formateDate(fromString: viewModel.info.results.civilTwilightEnd)
        astronomicalTwilightBeginsLabel.text = formateDate(fromString: viewModel.info.results.astronomicalTwilightBegin)
        astronomicalTwilightEndsLabel.text = formateDate(fromString: viewModel.info.results.astronomicalTwilightEnd)
    }

}


// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        SearchPlaces.shared.search(text: text, onSucces: {(location) in ()
            self.location = location
        })
        return true
    }
}


// MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}

