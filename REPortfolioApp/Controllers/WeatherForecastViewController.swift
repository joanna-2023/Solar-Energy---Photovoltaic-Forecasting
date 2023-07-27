//
//  WeatherForecastViewController.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-27.
//

import Foundation
import UIKit

class WeatherForecastViewController:UICollectionViewController{
    
    //TODO: Define size and so on as per the Swift manual - 
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
