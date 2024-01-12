//
//  APIEndPoint.swift
//  WeatherApp
//
//  Created by Pratik Mistry on 1/9/24.
//

import Foundation

enum APIEndPoint {
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinatesByLocationName(String)
    case weatherByLatLon(Double, Double)
    
    private var path: String {
        switch self {
        case .coordinatesByLocationName(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.weatherAPIKey)"
        case .weatherByLatLon(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.Keys.weatherAPIKey)"
        }
    }
    
    static func endPointURL(for endPoint: APIEndPoint) -> URL {
        return URL(string: baseURL + endPoint.path)!
    }
}
