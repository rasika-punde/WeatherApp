//
//  GeocodingClient.swift
//  WeatherApp
//
//  Created by Pratik Mistry on 1/9/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

struct GeocodingClient {
    func coordinateByCity(_ city: String) async throws -> Location? {
        let (data, response) = try await URLSession.shared.data(from: APIEndPoint.endPointURL(for: .coordinatesByLocationName(city)))
        guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations.first
    }
}
