//
//  HighLowView.swift
//  WeatherApp
//
//  Created by spencer selden on 5/8/23.
//

import SwiftUI

struct HighLowView: View {
    
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
                    Text("high: \(weatherManager.weather!.tempMaxString)")
                        .foregroundColor(.indigo)
                        .font(.title)
                        .padding(.trailing)
                    Text("low: \(weatherManager.weather!.tempMinString)")
                        .foregroundColor(.indigo)
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                }
            }
        }
    }
}

struct HighLowView_Previews: PreviewProvider {
    static var previews: some View {
        HighLowView()
    }
}
