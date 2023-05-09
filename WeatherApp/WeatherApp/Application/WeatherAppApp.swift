//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by spencer selden on 5/1/23.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    
    @StateObject var locationManager = LocationManager()
    @StateObject var weatherManager = WeatherManager()
    @StateObject var appData = ApplicationData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
                .environmentObject(weatherManager)
                .environmentObject(appData)

        }
    }
}
