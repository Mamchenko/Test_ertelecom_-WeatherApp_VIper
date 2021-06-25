//
//  BaseRouter.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import Foundation
import UIKit

protocol IBaseRouter {
}


class BaseRouter<T>: IBaseRouter where T: UIViewController  {
    weak var viewController: T?
    var navigationController: UINavigationController? {
        viewController?.navigationController
    }
}
