//
//  MainWeatherBlock.swift
//  WeatherApp
//
//  Created by spencer selden on 5/8/23.
//

import SwiftUI

struct MainWeatherBlock: View {
    
    @EnvironmentObject var weatherManager: WeatherManager
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.indigo)
                .frame(maxWidth: 300, maxHeight: 300)
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(maxWidth: 290, maxHeight: 290)
            if locationManager.isLoading == false {
                CurrentWeatherBlockView()
            } else if locationManager.isLoading == true || weatherManager.weatherFetching == true {
                ProgressView()
            }
        }
    }
}

struct MainWeatherBlock_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherBlock()
    }
}
