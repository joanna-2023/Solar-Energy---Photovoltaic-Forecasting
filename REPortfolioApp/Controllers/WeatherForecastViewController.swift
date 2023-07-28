//
//  WeatherForecastViewController.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-27.
//

import Foundation
import UIKit

class WeatherForecastViewController:UICollectionViewController{
    
    //Always show a month, but allow selection to vary
    
    func updateForecast(){
        self.collectionView.reloadData()
    }
    
    //Generate the collection view layout -
    
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(40.0*6),
            heightDimension: .absolute(55.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 6
        )
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    //Assign the layout -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.setCollectionViewLayout(generateLayout(),animated: false)
                                             
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weather", for: indexPath) as! WeatherCollectionCell
        cell.iconView?.clearStyles()
        if WeatherData.selectedWeatherPeriod == 0{
            if indexPath.row == 0 && indexPath.section == 0{
                cell.iconView?.styleSelected()
            }
        }else if  WeatherData.selectedWeatherPeriod == 1{
            if indexPath.section == 0{
                cell.iconView?.styleSelected()
            }
            if indexPath.row < 2 && indexPath.section == 1{
                cell.iconView?.styleSelected()
            }
        }else if  WeatherData.selectedWeatherPeriod == 2{
            cell.iconView?.styleSelected()
        }else{
            
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


