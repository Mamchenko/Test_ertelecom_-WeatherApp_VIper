//
//  WeatherApiManager.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 21.06.2021.
//

import Alamofire
import Foundation
import SVGKit

class WeatherApiManager {
    
    private let headers: HTTPHeaders = [
        "X-Yandex-API-Key": Constants.apiKey
    ]
    
    func getWeather(completion: @escaping (Weather?) -> Void) {
        AF.request(Constants.baseUrl, headers: headers).responseJSON { response in
            guard let data = response.data else { return }
            let weather = try? JSONDecoder().decode(Weather.self, from: data)
            completion(weather)
        }
    }
    
    func getIcon(type: String, completion: @escaping (SVGKImage?) -> Void) {
        let urlString = Constants.iconUrl + type + ".svg"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        AF.request(url, headers: headers).responseJSON { response in
            guard let data = response.data else { completion(nil); return }
            let svgImage: SVGKImage = SVGKImage(data: data)
            completion(svgImage)
        }
    }
}
