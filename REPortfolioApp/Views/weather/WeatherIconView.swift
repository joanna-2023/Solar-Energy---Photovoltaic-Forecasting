//
//  WeatherIconView.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-26.
//

import Foundation
import UIKit

class WeahterIconView:UIView{
    @IBOutlet var icon:UIImageView?
    @IBOutlet var degrees:UILabel?
    @IBOutlet var date:UILabel?
    
    func styleSelected(){
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = ThemeColorDuskSky.cgColor
        self.layer.backgroundColor = ThemeColorSeaGreen.cgColor
    }
    
    func setSunny(value:Float){
        icon?.image = UIImage(named: "sunny")
       // degrees?.text = String(value: "%d",value)
    }
    
    func setCloudy(value:Float){
        icon?.image = UIImage(named: "cloudy")
    }
    
    func setPartlyCloudy(value:Float){
        icon?.image = UIImage(named: "partlyCloudy")
    }
    
    func setRainy(value:Float){
        icon?.image = UIImage(named: "rainy")
    }
    
    func setSnowy(value:Float){
        icon?.image = UIImage(named: "snowy")
    }
}
