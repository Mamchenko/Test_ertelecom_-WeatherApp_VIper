//
//  DayWeather.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 21.06.2021.
//

// MARK: - Weather
struct Weather: Codable {
    let forecasts: [Forecast]

    enum CodingKeys: String, CodingKey {
        case forecasts
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let moonCode, dateTs: Int
    let hours: [Hour]
    let sunrise, moonText, sunset, setEnd: String
    let date: String
    let week: Int
    let parts: Parts
    let riseBegin: String

    enum CodingKeys: String, CodingKey {
        case moonCode = "moon_code"
        case dateTs = "date_ts"
        case hours, sunrise
        case moonText = "moon_text"
        case sunset
        case setEnd = "set_end"
        case date, week, parts
        case riseBegin = "rise_begin"
    }
}

// MARK: - Hour
struct Hour: Codable {
    let uvIndex: Int?
    let icon: String
    let windSpeed: Double
    let pressureMm: Int
    let hour: String?
    let humidity: Int
    let precMm: Double
    let feelsLike: Int
    let windGust, cloudness, precStrength: Double
    let precType, soilTemp: Int
    let soilMoisture: Double
    let precPeriod, precProb: Int
    let hourTs: Int?
    let pressurePa: Int
    let temp: Int?
    let isThunder: Bool?
    let source: String?
    let tempAvg, tempMin, tempMax: Int?
    let polar: Bool?

    enum CodingKeys: String, CodingKey {
        case uvIndex = "uv_index"
        case icon
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"
        case hour
        case humidity
        case precMm = "prec_mm"
        case feelsLike = "feels_like"
        case windGust = "wind_gust"
        case cloudness
        case precStrength = "prec_strength"
        case precType = "prec_type"
        case soilTemp = "soil_temp"
        case soilMoisture = "soil_moisture"
        case precPeriod = "prec_period"
        case precProb = "prec_prob"
        case hourTs = "hour_ts"
        case pressurePa = "pressure_pa"
        case temp
        case isThunder = "is_thunder"
        case source = "_source"
        case tempAvg = "temp_avg"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case polar
    }
}

// MARK: - Parts
struct Parts: Codable {
    let dayShort, night, evening, day: Hour
    let nightShort, morning: Hour

    enum CodingKeys: String, CodingKey {
        case dayShort = "day_short"
        case night, evening, day
        case nightShort = "night_short"
        case morning
    }
}
