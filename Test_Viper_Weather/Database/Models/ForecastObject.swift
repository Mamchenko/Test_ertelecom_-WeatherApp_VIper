//
//  ForecastObject.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 23.06.2021.
//

import RealmSwift

class ForecastObject: Object, Decodable {
    @objc dynamic var fixtureID = 0
    var hours = List<HourObject>()
}

class HourObject: Object, Decodable {
    @objc dynamic var name : String?
}
