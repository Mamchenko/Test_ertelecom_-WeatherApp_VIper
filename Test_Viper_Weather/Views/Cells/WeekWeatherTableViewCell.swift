//
//  WeakWeatherTableViewCell.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import SnapKit
import UIKit
import SVGKit

class WeekWeatherTableViewCell: UITableViewCell {
    
    enum UIConstants {
        static let weatherIconSize = 20
        static let temperatureTrailingInset = 10
    }
    
    private let dateLabel = UILabel()
    private let weatherIcon = UIImageView()
    
    private let temperatureLabel: UILabel = {
        let view = UILabel()
        view.textColor = .systemGray3
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        [dateLabel, weatherIcon, temperatureLabel].forEach{contentView.addSubview($0)}
        
        dateLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.centerX.equalToSuperview()
        }
        
        weatherIcon.snp.makeConstraints { maker in
            maker.trailing.centerY.equalToSuperview()
            maker.size.equalTo(UIConstants.weatherIconSize)
        }
        temperatureLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.leading.equalToSuperview().inset(UIConstants.temperatureTrailingInset)
        }
    }
    
    func configure(weather: Forecast, icon: UIImage?) {
        dateLabel.text = weather.date
        weatherIcon.image = icon
        temperatureLabel.text = String(weather.parts.dayShort.temp ?? 0)
    }
}
