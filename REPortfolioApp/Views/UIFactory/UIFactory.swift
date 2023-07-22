//
//  UIFactoryMenu.swift
//  REPortfolioApp
//
//  Created by Joanna Nikolova on 2023-07-20.
//

import Foundation
import UIKit

class UIFactory{
    
    //Main views - decorations and designs -
    static func styleMainSection(section:UIView){
        section.layer.cornerRadius = 5
        section.layer.shadowOffset = CGSize(width:5,height:5)
    }
    
    
    //Menu -
    static func designMenuHeader(title:String,
                          tableView:UITableView)->UIView{
        var f = tableView.frame
        f.size.height = 44.0
        let v = UIView(frame: f)
        f.origin.x = 25
        f.origin.y = -10
        f.size.height = 34
        let l = UILabel(frame: f)
        l.text = title
        //v.backgroundColor = ThemeColorDuskSky
        v.addSubview(l)
        v.layoutSubviews()
        return v;
    }
}
