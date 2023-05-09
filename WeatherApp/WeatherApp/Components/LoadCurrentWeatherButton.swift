//
//  ShareLocationButtonView.swift
//  WeatherApp
//
//  Created by spencer selden on 5/4/23.
//

import SwiftUI

struct LoadCurrentWeatherButton: View {
    
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var weatherManager: WeatherManager
    
    var body: some View {
        
        Button {
            locationManager.requestLocation()
            print("current location requested")
        } label: {
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.white)
                
                Text("Current Location")
                    .foregroundColor(.white)
            }
            .padding()
            .background(.indigo)
            .background(in: RoundedRectangle(cornerRadius: 5))
        }
        
    }
}

struct ShareLocationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoadCurrentWeatherButton()
            .environmentObject(LocationManager())
            .environmentObject(WeatherManager())
    }
}
