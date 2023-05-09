//
//  ContentView.swift
//  WeatherApp
//
//  Created by spencer selden on 5/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var weatherManager: WeatherManager
    @FocusState var isFocused: Bool
    @EnvironmentObject var appData: ApplicationData
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if appData.showWeather == false {
                    Spacer()
                }
                SearchFieldView()
                    .padding(.bottom)
                if appData.showWeather == true {
                    MainWeatherBlock()
                    .padding(.bottom)
                    HighLowView()
                        .padding(.bottom)
                    WindSpeedView()
                }
                Spacer()
            }
            .onChange(of: locationManager.isLoading, perform: { newValue in
                appData.showWeather = true
            })
            .padding()
            .onAppear {
                locationManager.manager.requestWhenInUseAuthorization()
                print("location access requested")
            }
        }
        
        
        
    }
}
