//
//  ForecastAndAnalysisViewController.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-20.
//

import Foundation
import UIKit
import SwiftUI

class ForecastAndAnalysisViewController:UIViewController{
    var chartView:UIView?
    @IBOutlet var chartTitle:UILabel?
    
    override func viewDidLoad() {
        UIFactory.styleMainSection(section: self.view)
        let barChart = SingleBar(isOverview: true)
        let vc = UIHostingController(rootView: barChart)
        chartView = vc.view
        self.view.addSubview(chartView!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var f = self.view.frame
        f.origin = CGPoint(x: 20,y: 20)
        f.size.width = f.size.width - 40
        f.size.height = f.size.height - 40
        chartView?.frame = self.view.frame
        self.view.bringSubviewToFront(chartView!)
        self.view.bringSubviewToFront(chartTitle!)
    }
}
