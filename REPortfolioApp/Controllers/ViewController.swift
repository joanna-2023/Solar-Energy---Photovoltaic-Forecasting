//
//  ViewController.swift
//  REPortfolioApp
//
//  Created by Joanna Nikolova on 2023-07-19.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let pvSimulationAnalizer = PVSimulationAnalysis.shared
    
    @IBOutlet var mainMap:MainMapView?
    @IBOutlet var inputParameters:InputParametersView?
    @IBOutlet var simulationOutput:SimulationOutputView?
    @IBOutlet var forecastContainer:CustomContainerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pvSimulationAnalizer.baseURLRequest()
        //
        inputParameters?.style()
        simulationOutput?.style()
        mainMap?.style()
        forecastContainer?.style()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //MAP
        let mapCenter = CLLocationCoordinate2D(latitude:40.0,
                                            longitude:-118.0)
        mainMap?.setCenter(mapCenter, animated: true)
    }

}

