//
//  AppModel.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-21.
//

import Foundation
import UIKit

//enum ForecastType{
     //let daily:Int,
    //let weekly:Int
//}

class AppModel{
    static var siteName:String = "Tucson"
    static var siteLatitude:Double = 32.2
    static var siteLongitude:Double = -111.0
    static var siteGMTZone:String = "Etc/GMT+7"
    
    static var solarCompanies = ["Sunpower",
                                 "Sunrun",
                                 "Canadian Solar",
                                 "Jinko Solar"]
    static var modulesNum = 700
    static var company = "Sunpower"
    static var forecast = "daily"
    
    //GET
    static func siteLat()->Double{
        return siteLatitude
    }
    
    static func siteLon()->Double{
        return siteLongitude
    }
    
    static func modsNum()->Int{
        return modulesNum
    }
    
    //SET
    static func setSiteLat(v:Double){
        siteLatitude = v
    }
    
    static func setSiteLon(v:Double){
        siteLongitude = v
    }
    
    static func setModsNum(v:Int){
        modulesNum = v
    }
}
