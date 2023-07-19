//
//  ViewController.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-19.
//

import UIKit

class ViewController: UIViewController {

    let pvSimulationAnalizer = PVSimulationAnalysis.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pvSimulationAnalizer.baseURLRequest()
    }

}

