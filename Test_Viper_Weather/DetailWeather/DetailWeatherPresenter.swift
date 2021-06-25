//
//  DetailWeatherPresenter.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import Foundation
import UIKit

protocol IDetailWeatherPresenter: AnyObject {
    func showDetailWeather(hourWeather: [Hour], icons: [UIImage?])
    func viewDidLoad()
}

class DetailWeatherPresenter: IDetailWeatherPresenter {
    
    weak var view: IDetailWeatherViewController?
    let interactor: IDetailWeatherInteractor
    
    init(interactor: IDetailWeatherInteractor) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.getDetailWeather()
    }
    
    func showDetailWeather(hourWeather: [Hour], icons: [UIImage?]) {
        view?.showHoures(houres: hourWeather, icons: icons)
    }

    
}
