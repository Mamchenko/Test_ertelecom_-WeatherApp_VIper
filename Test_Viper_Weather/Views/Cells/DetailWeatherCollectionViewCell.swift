//
//  DetailWeatherCollectionViewCell.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import SnapKit
import UIKit

class DetailWeatherCollectionViewCell: UICollectionViewCell {
    
    enum UIConstants {
        static let stackViewSpacing: CGFloat = 5
        static let stackViewInset: CGFloat = 30
        static let imageViewSize: CGFloat = 100
    }
    
    let timeLable : UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 21)
        view.textAlignment = .center
        return view
    }()
    
    let hourWeatherIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let temperatureLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 21)
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    func configureUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstants.stackViewSpacing
        
        stackView.addArrangedSubview(timeLable)
        stackView.addArrangedSubview(hourWeatherIcon)
        stackView.addArrangedSubview(temperatureLabel)
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(UIConstants.stackViewInset)
        }
        
        hourWeatherIcon.snp.makeConstraints { maker  in
            maker.size.equalTo(UIConstants.imageViewSize)
        }
    }
    
    func configure(hourWheather: Hour, icon: UIImage?) {
        hourWeatherIcon.image = icon
        timeLable.text = "\(hourWheather.hour ?? "")" + ":00"
        temperatureLabel.text = String(hourWheather.temp ?? 0) + " " + "c"
    }
    
}
