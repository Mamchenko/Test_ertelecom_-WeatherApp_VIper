//
//  WeekWeatherRouter.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import Foundation

protocol IWeekWeatherRouter {
    func openDetailViewController(forecast: Forecast)
}

class WeekWeatherRouter: BaseRouter<WeekWeatherViewController>, IWeekWeatherRouter {
    func openDetailViewController(forecast: Forecast) {
        guard let viewController = viewController else {return}
        let detailViewController = DetailWeatherModuleBuilder.build(forecast: forecast)
        viewController.present(detailViewController, animated: true, completion: nil)
    }
}
