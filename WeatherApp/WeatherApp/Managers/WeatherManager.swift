//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by spencer selden on 5/5/23.
//

import Foundation
import CoreLocation

//Weather API Key https://pro.openweathermap.org/data/2.5/forecast/hourly?lat=44.34&lon=10.99&appid=531cab9c638db1525e12980458c6bbce

class WeatherManager: ObservableObject {
    
    @Published var weather: WeatherModel?
    @Published var showButton: Bool = true
    @Published var weatherFetching: Bool = false
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=531cab9c638db1525e12980458c6bbce&units=imperial"
    
    //var delegate: WeatherManagerDelegate?
        
    func fetchWeather(cityName: String) {
        let newCityName = cityName.replacingOccurrences(of: " ", with: "%20")
        let urlString = "\(weatherURL)&q=\(newCityName)"
        print(urlString)
        performRequest(with: urlString)
        weatherFetching = true
        print("weather fetched successfully")
    }
    
    func fetchWeatherLatLon( lattitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let lat = lattitude
        let lon = longitude
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(with: urlString)
        weatherFetching = true
        print("weather fetched successfully")
    }
    
    func performRequest(with urlString: String) {
        //1) create URL
        if let url = URL(string: urlString) {
            
            //2) create URL Session
            let session = URLSession(configuration: .default)
            
            //3) Give session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("there was an error perorming request")
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parsJSON(safeData) {
                        self.updateWeatherModel(weather: weather)
                    }
                }
            }
            //4) start the task
            task.resume()
        }
    }
    
    func updateWeatherModel(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.weather = weather
            self.weatherFetching = false
        }
        
    }
    
    func parsJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let country = decodedData.sys.country
            let description = decodedData.weather[0].description
            let tempMin = decodedData.main.temp_min
            let tempMax = decodedData.main.temp_max
            let windSpeed = decodedData.wind.speed
            
            let weather = WeatherModel(conditionID: id, name: name, temp: temp, country: country, description: description, tempMin: tempMin, tempMax: tempMax, windSpeed: windSpeed)
            print(weather)
            return weather
        } catch {
            print("there was an error in func ParsJSON \(error)")
            return nil
        }
    }
    
}
