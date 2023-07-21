//
//  AppModel.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-21.
//

import Foundation
import UIKit

class AppModel{
    static var siteLatitude:Double = 40.0
    static var siteLongitude:Double = -118.0
    
    static var modulesNum = 50
    
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
