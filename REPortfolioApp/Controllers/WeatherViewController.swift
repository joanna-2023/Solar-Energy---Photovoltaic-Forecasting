//
//  WeatherViewController.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-26.
//

import Foundation
import UIKit

class WeatherViewController:UIViewController{
    
    var weatherForecastVC:WeatherForecastViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        weatherForecastVC = storyBoard.instantiateViewController(identifier: "WeatherForecastViewController")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(weatherForecastVC!.view.superview == nil){
            self.view.addSubview(weatherForecastVC!.view)
        }
    }
}
