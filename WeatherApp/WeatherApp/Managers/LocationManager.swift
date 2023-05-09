//
//  LocationManager.swift
//  WeatherApp
//
//  Created by spencer selden on 5/4/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    @Published var defaultLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297)
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("there was an error loading the location \(error)")
        isLoading = false
    }
}
