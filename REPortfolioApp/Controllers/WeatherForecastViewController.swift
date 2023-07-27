//
//  WeatherForecastViewController.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-27.
//

import Foundation
import UIKit

class WeatherForecastViewController:UICollectionViewController{
    
    //Generate the collection view layout -
    
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(50.0*5),
            heightDimension: .absolute(55.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 5
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
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weather", for: indexPath)
        return cell
    }
}


