//
//  DetailWeatherViewController.swift
//  Test_Viper_Weather
//
//  Created by Anatoliy Mamchenko on 22.06.2021.
//

import SnapKit
import UIKit

protocol IDetailWeatherViewController: AnyObject {
    func showHoures(houres: [Hour], icons: [UIImage?])
}

class DetailWeatherViewController: UIViewController {
    
    enum UIConstant {
        static let cellIdentifire = "DetailWeatherInHour"
        static let collectionViewTopInset: CGFloat = 15
        static let collectionViewLeftRightInset: CGFloat = 10
    }

    
     lazy var detailWeatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: UIConstant.collectionViewTopInset, left: UIConstant.collectionViewLeftRightInset, bottom: .zero, right: UIConstant.collectionViewLeftRightInset)
        layout.itemSize = CGSize(width: (view.bounds.width - 30) / 2, height: (view.bounds.height - 20) / 3)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(DetailWeatherCollectionViewCell.self, forCellWithReuseIdentifier: UIConstant.cellIdentifire)
        collection.backgroundColor = .white
        return collection
    }()
    
    let currentWeatherImageView: UIImageView = {
       let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view 
    }()
    
    let presenter: IDetailWeatherPresenter
    
    init(presenter: IDetailWeatherPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    var hour: [Hour] = []
    var icons: [UIImage?] = []
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter.viewDidLoad()
    }
    
    private func initialize() {
        view.backgroundColor = .white
        view.addSubview(detailWeatherCollectionView)
        detailWeatherCollectionView.delegate = self
        detailWeatherCollectionView.dataSource = self
        
        detailWeatherCollectionView.snp.makeConstraints { maker in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension DetailWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hour.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UIConstant.cellIdentifire, for: indexPath) as! DetailWeatherCollectionViewCell
        cell.configureCell()
        cell.configureUI()
        cell.configure(hourWheather: hour[indexPath.row], icon: icons[indexPath.row])
        return cell
    }
}


extension DetailWeatherViewController: IDetailWeatherViewController {
    func showHoures(houres: [Hour], icons: [UIImage?]) {
        self.hour = houres
        self.icons = icons
        DispatchQueue.main.async {
            self.detailWeatherCollectionView.reloadData()
        }
    }
}
