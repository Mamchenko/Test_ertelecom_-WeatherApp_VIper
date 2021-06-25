//
//  CheckConnectionManager.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import Foundation
import Reachability
import SVGKit

class WeekWeatherManager {
    
    private let apiManager: WeatherApiManager
    private let dbManager: DatabaseManager
    
    init(apiManager: WeatherApiManager = WeatherApiManager(), databaseManager: DatabaseManager = DatabaseManager()) {
        self.apiManager = apiManager
        self.dbManager = databaseManager
    }
    
    private let reachability = try! Reachability()
    
    func getWeather(completion: @escaping (Weather?) -> Void) {
        switch reachability.connection {
        case .wifi, .cellular: //get data from API if connection is working
            apiManager.getWeather { weather in
                completion(weather)
            }
        case .unavailable, .none:
            completion(nil) // get data from database
        }
    }
    
    func getIcon(type: String, completion: @escaping (SVGKImage?) -> Void) {
        switch reachability.connection {
        case .wifi, .cellular: // //get data from API if connection is working
            apiManager.getIcon(type: type) { icon in
                completion(icon)
            }
        case .unavailable, .none:
            completion(nil) // get data from database
        }
    }
}
