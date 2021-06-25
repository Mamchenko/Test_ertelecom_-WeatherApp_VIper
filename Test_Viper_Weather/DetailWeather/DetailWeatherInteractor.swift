//
//  DetailWeatherInteractor.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import Foundation
import UIKit

protocol IDetailWeatherInteractor {
    func getDetailWeather()
}

class DetailWeatherInteractor: IDetailWeatherInteractor {
    
    weak var presenter: IDetailWeatherPresenter?
    private let forecast: Forecast
    private let manager: WeekWeatherManager
    
    init(forecast: Forecast, manager: WeekWeatherManager = WeekWeatherManager()) {
        self.forecast = forecast
        self.manager = manager
    }
    
    func getDetailWeather() {
        var icons: [UIImage?] = []
        let array = forecast.hours
        let group = DispatchGroup()
        forecast.hours.forEach({
            group.enter()
            self.manager.getIcon(type: $0.icon) { icon in
                icons.append(icon?.uiImage)
                print("group leave")
                group.leave()
            }
        })
        group.notify(queue: .main) {
            print ("array send")
            self.presenter?.showDetailWeather(hourWeather: array, icons: icons)
        }
    }
}
