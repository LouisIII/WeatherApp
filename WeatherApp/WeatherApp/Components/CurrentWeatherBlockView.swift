//
//  CurrentWeatherBlockView.swift
//  WeatherApp
//
//  Created by spencer selden on 5/6/23.
//

import SwiftUI

struct CurrentWeatherBlockView: View {
    
    @EnvironmentObject var weatherManager: WeatherManager
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        if locationManager.isLoading == false {
            VStack {
                HStack {
                    HStack {
                        Spacer()
                        if weatherManager.weather != nil {
                            Text(weatherManager.weather!.tempString)
                                .foregroundColor(.indigo)
                                .font(.system(size: 80))
                        }
                    }
                    VStack {
                        HStack{
                            Spacer()
                            if weatherManager.weather != nil {
                                Image(systemName: weatherManager.weather!.conditionName)
                                    .font(.system(size: 80))
                                    .foregroundColor(.indigo)
                            }
                            Spacer()
                        }
                        if weatherManager.weather != nil {
                            Text("")
                                .font(.callout)
                                .foregroundColor(.indigo)
                        }
                    }
                }
                HStack {
                    Spacer()
                    if weatherManager.weather != nil {
                        Text("\(weatherManager.weather!.name), \(weatherManager.weather!.country)")
                            .foregroundColor(.indigo)
                            .font(.body)
                    }
                    Spacer()
                }
            }
            .frame(maxWidth: 250, maxHeight: 250)
            .onAppear {
                if let location = locationManager.location {
                    weatherManager.fetchWeatherLatLon(lattitude: location.latitude, longitude: location.longitude)
                }
            }
        }
    }
}
