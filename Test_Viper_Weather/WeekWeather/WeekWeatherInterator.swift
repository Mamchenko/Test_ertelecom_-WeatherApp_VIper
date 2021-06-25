//
//  WeekWeatherInterator.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import UIKit

protocol IWeekWeatherInterator: AnyObject {
    func getWeather()
}

class WeakWeetherInterator: IWeekWeatherInterator {
    
    weak var presenter: IWeekWeatherPresenter?
    private let manager: WeekWeatherManager
    
    init(manager: WeekWeatherManager = WeekWeatherManager()) {
        self.manager = manager
    }
    
    func getWeather() {
        manager.getWeather { [weak self] weather in
            guard let self = self else { return }
            var icons: [UIImage?] = []
            let group = DispatchGroup()
            weather?.forecasts.forEach({
                group.enter()
                self.manager.getIcon(type: $0.parts.dayShort.icon) { icon in
                    icons.append(icon?.uiImage)
                    group.leave()
                }
            })
            group.notify(queue: .main) {
                self.presenter?.showForecasts(forecasts: weather?.forecasts ?? [], icons: icons)
            }
        }
    }
}
