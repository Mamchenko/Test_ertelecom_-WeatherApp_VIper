//
//  ViewController.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 21.06.2021.
//

import SnapKit
import UIKit

protocol IWeekWeatherViewController: AnyObject {
    func showForecasts(forecasts: [Forecast], icons: [UIImage?])
}

class WeekWeatherViewController: UIViewController {
    
    enum UIConstant {
        static let cellIdentifier =  "weatherOfTheWeakCell"
    }
    
    private let weatherTableView: UITableView = {
        let view = UITableView()
        view.register(WeekWeatherTableViewCell.self, forCellReuseIdentifier: UIConstant.cellIdentifier)
        return view
    }()
    
    private let presenter: IWeekWeatherPresenter
    init(presenter: IWeekWeatherPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    var forecasts: [Forecast] = []
    var icons: [UIImage?] = []
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter.viewDidLoaded()
    }
    
    private func initialize() {
        view.backgroundColor = .white
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        view.addSubview(weatherTableView)
        weatherTableView.snp.makeConstraints { maker in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UITableViewDataSource
extension WeekWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIConstant.cellIdentifier) as! WeekWeatherTableViewCell
        cell.configure(weather: forecasts[indexPath.row], icon: icons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

// MARK: - UITableViewDelegate
extension WeekWeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.openDetails(forecast: forecasts[indexPath.row])
    }
}

// MARK: - IWeekWeatherViewController
extension WeekWeatherViewController: IWeekWeatherViewController {
    func showForecasts(forecasts: [Forecast], icons: [UIImage?]) {
        self.forecasts = forecasts
        self.icons = icons
        DispatchQueue.main.async {
            self.weatherTableView.reloadData()
        }
    }
}
