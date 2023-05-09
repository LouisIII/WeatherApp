//
//  WeatherData.swift
//  WeatherApp
//
//  Created by spencer selden on 5/6/23.
//

import Foundation


struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let sys: Sys
    let wind: Wind
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Codable {
    let speed: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

struct Sys: Codable {
    let country: String
}
