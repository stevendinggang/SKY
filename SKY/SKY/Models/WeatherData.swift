//
//  WeatherData.swift
//  SKY
//
//  Created by 开心粮票 on 2017/10/25.
//  Copyright © 2017年 eeee. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let currently: CurrentWeather
    
    struct CurrentWeather: Codable {
        let time: Date
        let summary: String
        let icon: String
        let temperature: Double
        let humidity: Double
    }
}
