//
//  MainMapView.swift
//  REPortfolioApp
//
//  Created by Desi (Desislava) Nikolova on 2023-07-20.
//

import Foundation
import MapKit
import UIKit

class MainMapView:MKMapView{
    func style(){
        UIFactory.styleMainSection(section: self)
    }
}
