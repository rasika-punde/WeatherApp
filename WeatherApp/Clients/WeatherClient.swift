//
//  WeatherClient.swift
//  WeatherApp
//
//  Created by Pratik Mistry on 1/9/24.
//

import Foundation

struct WeatherClient {
    func fetchWeather(location: Location) async throws -> Weather {
        let (data, response) = try await URLSession.shared.data(from: APIEndPoint.endPointURL(for: .weatherByLatLon(location.lat, location.lon)))
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else { throw NetworkError.invalidResponse }
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.main
    }
}
