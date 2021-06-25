//
//  Constants.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 23.06.2021.
//

import Foundation

struct Constants {
    
    static var apiKey: String {
        return "68d31597-6397-469e-82e7-7d2f606aa33c"
    }
    
    static var baseUrl: URL {
        return URL(string: "https://api.weather.yandex.ru/v2/forecast?week")!
    }
    
    static let iconUrl = "https://yastatic.net/weather/i/icons/blueye/color/svg/"
}
