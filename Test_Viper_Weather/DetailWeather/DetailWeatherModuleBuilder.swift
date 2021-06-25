//
//  DetailWeatherModuleBuilder.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import Foundation
import UIKit

class DetailWeatherModuleBuilder {
    static func build(forecast: Forecast) -> UIViewController {
        let interactor = DetailWeatherInteractor(forecast: forecast)
        let presenter = DetailWeatherPresenter(interactor: interactor)
        let controller = DetailWeatherViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.view = controller
        return controller
    }
}
