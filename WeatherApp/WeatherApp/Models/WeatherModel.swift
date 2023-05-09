//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by spencer selden on 5/6/23.
//

import Foundation


struct WeatherModel {
    let conditionID: Int
    let name: String
    let temp: Double
    let country: String
    let description: String
    let tempMin: Double
    let tempMax: Double
    let windSpeed: Double
    
    var windSpeedString: String {
        return String(format: "%.1f", windSpeed)
    }
    
    var tempString: String {
        return String(format: "%.0f", temp)
    }
    
    var tempMaxString: String {
        return String(format: "%.0f", tempMax)
    }
    
    var tempMinString: String {
        return String(format: "%.0f", tempMin)
    }
    
    var conditionName: String {
        switch conditionID {
        case 200...232: return "cloud.bolt"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.rain"
        case 600...622: return "cloud.snow"
        case 800: return "sun.max"
        case 801...804: return "cloud"
        case 701: return "cloud.fog"
        case 711: return "flame"
        case 721: return "sun.haze"
        case 731: return "sun.dust"
        case 741: return "cloud.fog"
        case 751: return "sun.dust"
        case 761: return "sun.dust"
        case 762: return "flame"
        case 771: return "wind"
        case 781: return "tornado"
        default: return "cloud"
        }
    }
}
