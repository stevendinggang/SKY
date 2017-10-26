//
//  WeatherDataManager.swift
//  SKY
//
//  Created by Steven on 2017/10/25.
//  Copyright © 2017年 eeee. All rights reserved.
//

import Foundation

enum DataManagerError: Error {
    case failedRequest
    case invalidResponse
    case unknown
}

final class WeatherDataManager {
    private let baseURL: URL
    private init(baseURL: URL){
        self.baseURL = baseURL
    }
    
    static let shared = WeatherDataManager(baseURL: API.authenticatedURL)
    
    typealias CompletionHandler = (WeatherData?,DataManagerError?) ->Void
    
    func weatherDataAt(
        latitude: Double,
        longitude: Double,
        completion: @escaping CompletionHandler){
        
        // 1. Concatenate the URL
        let url = baseURL.appendingPathComponent("\(latitude),\(longitude)")
        var request = URLRequest(url: url)
        
        // 2. Set HTTP header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // 3. Launch the request
        URLSession.shared.dataTask(with: request, completionHandler: {
           (data, response, error) in
            DispatchQueue.main.async {
//            self.dis
            }
            
        // 4. Get the response here
        }).resume()
    }
    
    
    func didFinishGettingWeatherData(data: Data?, response: URLSession?, error: Error?, completion: CompletionHandler) {
        
        if let _ = error {
            completion(nil, .failedRequest)
        }
        else if let data = data,let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                do {
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)

                    completion(weatherData,nil)
                }
                catch {
                    completion(nil,.invalidResponse)
                }
        }
    }
  }
}















