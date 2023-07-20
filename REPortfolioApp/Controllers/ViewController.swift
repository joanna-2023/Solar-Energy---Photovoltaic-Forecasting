//
//  ViewController.swift
//  REPortfolioApp
//
//  Created by Joanna Nikolova on 2023-07-19.
//

import UIKit

class ViewController: UIViewController {

    let pvSimulationAnalizer = PVSimulationAnalysis.shared
    
    @IBOutlet var mainMap:MainMapView?
    @IBOutlet var inputParameters:InputParametersView?
    @IBOutlet var simulationOutput:SimulationOutputView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pvSimulationAnalizer.baseURLRequest()
    }

}

