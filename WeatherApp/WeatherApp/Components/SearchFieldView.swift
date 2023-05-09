//
//  SearchFieldView.swift
//  WeatherApp
//
//  Created by spencer selden on 5/8/23.
//

import SwiftUI

struct SearchFieldView: View {
    
    @EnvironmentObject var weatherManager: WeatherManager
    @EnvironmentObject var locationManager: LocationManager
    @FocusState var isFocused: Bool
    @EnvironmentObject var appData: ApplicationData
    
    @State private var searchInput: String = ""
    var body: some View {
        HStack {
            Spacer()
                TextField("city name...", text: $searchInput)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 30)
                    .submitLabel(.search)
                    .focused($isFocused)
                    .onSubmit {
                        weatherManager.fetchWeather(cityName: searchInput)
                        locationManager.isLoading = false
                        appData.showWeather = true
                    }
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.indigo)
                    .padding(.trailing, 30)
        }
        .onAppear{
            isFocused = true
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button {
                    locationManager.requestLocation()
                    print("current location requested")
                    isFocused.toggle()
                } label: {
                    HStack {
                        
                        Text("Current Location")
                            .foregroundColor(.indigo)
                    }
                    .padding()
                }
            }
        }
    }
}

struct SearchFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFieldView()
    }
}
