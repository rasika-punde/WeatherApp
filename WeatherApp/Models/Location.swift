//
//  Location.swift
//  WeatherApp
//
//  Created by Pratik Mistry on 1/9/24.
//

import Foundation

struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
}
