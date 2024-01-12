//
//  Weather.swift
//  WeatherApp
//
//  Created by Pratik Mistry on 1/9/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
