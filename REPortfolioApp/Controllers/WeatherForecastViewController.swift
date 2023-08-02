//
//  WeatherForecastViewController.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-27.
//

import Foundation
import UIKit

class WeatherForecastViewController:UICollectionViewController{
    
    var selectedIndexPath:IndexPath = IndexPath(row: 0, section: 0)
    let weatherModel = WeatherData()
    var observations = Array<WeatherObservation>()
    //Always show a month, but allow selection to vary
    
    func updateForecast(){
        observations = weatherModel.allDaysInMonth()
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
        observations = weatherModel.allDaysInMonth()
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
        
        //Assign day and weekday -
        if(indexPath.section * 5 + indexPath.row) <= 30{
            let wo = observations[indexPath.section * 5 + indexPath.row]
            print(wo.dayOfWeek,wo.dayOfMonth, indexPath.section * indexPath.row + indexPath.row)
            cell.iconView?.date?.text = String(format: "%@,%d", wo.monthOfYear,wo.dayOfMonth)
        }
        
        //Style based on selection and period choice -
        cell.iconView?.clearStyles()
        var startSection = selectedIndexPath.section
        var startRow = selectedIndexPath.row
        if indexPath.row == selectedIndexPath.row &&
           indexPath.section == selectedIndexPath.section{
            cell.iconView?.styleSelected()
        }
        if  WeatherData.selectedWeatherPeriod == 1{
            if indexPath.section == startSection &&
                indexPath.row >= startRow{
                cell.iconView?.styleSelected()
            }
            if indexPath.section == startSection + 1{
                if abs(7 - startRow) <= (7 - indexPath.row)+1{
                    cell.iconView?.styleSelected()
                }
               
            }
        }else if  WeatherData.selectedWeatherPeriod == 2{
            cell.iconView?.styleSelected()
        }else{
            
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(indexPath.section,indexPath.row)
        selectedIndexPath = indexPath
        self.collectionView.reloadData()
    }
}


