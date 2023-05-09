//
//  WindSpeedView.swift
//  WeatherApp
//
//  Created by spencer selden on 5/8/23.
//

import SwiftUI

struct WindSpeedView: View {
    
    @EnvironmentObject var weatherManager: WeatherManager
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.indigo)
                .frame(maxWidth: 300, maxHeight: 100)
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .frame(maxWidth: 290, maxHeight: 90)
            if weatherManager.weather != nil {
                HStack {
                    Spacer()
                    Text("wind speed: \(weatherManager.weather!.windSpeedString)")
                        .foregroundColor(.indigo)
                        .font(.title)
                    Spacer()
                }
            }
        }
    }
}

struct WindSpeedView_Previews: PreviewProvider {
    static var previews: some View {
        WindSpeedView()
    }
}
