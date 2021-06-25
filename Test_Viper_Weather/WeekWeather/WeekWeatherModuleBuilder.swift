//
//  WeekWeatherModuleBuilder.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import Foundation
import UIKit

class WeekWeatherModuleBuilder {
    static func build() -> UIViewController {
        let interactor = WeakWeetherInterator()
        let router = WeekWeatherRouter()
        let presenter = WeekWeatherPresenter(interactor: interactor, router: router)
        let controller = WeekWeatherViewController(presenter: presenter)
        router.viewController = controller
        presenter.view = controller
        interactor.presenter = presenter
        return controller
    }
}
