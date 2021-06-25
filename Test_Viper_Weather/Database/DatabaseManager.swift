//
//  DatabaseManager.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import RealmSwift

class DatabaseManager {
    
    let realm = try! Realm()
    
    func saveCurrentWeatherData(object: ForecastObject) {
        realm.beginWrite()
        
        try! realm.commitWrite()
    }
    
    func getObject() {
        
    }
    
}
