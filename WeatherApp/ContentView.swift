//
//  ContentView.swift
//  WeatherApp
//
//  Created by Pratik Mistry on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city = ""
    @State private var isFetching = false
    @State private var weather: Weather?
    
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
    
    private func fetchWeather() async {
        do {
            guard let location = try await geocodingClient.coordinateByCity(city) else {
                return
            }
            weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            
        }
    }
    
    var body: some View {
        VStack {
            TextField("Enter a city name", text: $city).textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetching = true
                }.task(id: isFetching) {
                    if isFetching {
                        await fetchWeather()
                        isFetching = false
                    }
                }.onTapGesture {
                    city = ""
                    weather = nil
                }
                .padding(50)
                .font(.title2)
            if let weather {
                Text(MeasurementFormatter.temperature(value: weather.temp))
                    .foregroundStyle(.white)
                    .font(.system(size: 100))
            }
            Spacer()
        }
        .background(.indigo)
        
    }
}

#Preview {
    ContentView()
}
