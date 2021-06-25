//
//  WeakWeatherPresenter.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import UIKit

protocol IWeekWeatherPresenter: AnyObject {
    func viewDidLoaded()
    func showForecasts(forecasts: [Forecast], icons: [UIImage?])
    func openDetails(forecast: Forecast)
}

class WeekWeatherPresenter: IWeekWeatherPresenter {
    
    weak var view: IWeekWeatherViewController?
    let interactor: IWeekWeatherInterator
    var router: IWeekWeatherRouter
    
    init(interactor: IWeekWeatherInterator, router: IWeekWeatherRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoaded() {
        interactor.getWeather()
    }
    
    func showForecasts(forecasts: [Forecast], icons: [UIImage?]) {
        view?.showForecasts(forecasts: forecasts, icons: icons)
    }
    
    func openDetails(forecast: Forecast) {
        router.openDetailViewController(forecast: forecast)
    }
}
