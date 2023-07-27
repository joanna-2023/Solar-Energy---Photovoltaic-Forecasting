//
//  ViewController.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-19.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let pvSimulationAnalizer = PVSimulationAnalysis.shared
    
    @IBOutlet var mainMap:MainMapView?
    @IBOutlet var inputParameters:InputParametersView?
    @IBOutlet var simulationOutput:SimulationOutputView?
    //
    @IBOutlet var tableContainer:CustomContainerView?
    @IBOutlet var weatherContainer:CustomContainerView?
    @IBOutlet var forecastOuterContainer:CustomContainerView?
    @IBOutlet var mapContainer:CustomContainerView?
    @IBOutlet var forecastContainer:CustomContainerView?
    //
    @IBOutlet var dayWeekMonth:UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pvSimulationAnalizer.baseURLRequest()
        inputParameters?.style()
        simulationOutput?.style()
        mainMap?.style()
        forecastContainer?.style()
        tableContainer?.style()
        weatherContainer?.style()
        forecastOuterContainer?.style()
        mapContainer?.style()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //MAP
        let mapCenter = CLLocationCoordinate2D(latitude:AppModel.siteLat(),
                                               longitude:AppModel.siteLon())
        mainMap?.setCenter(mapCenter, animated: true)
        
        //INPUT
        inputParameters?.controllerDelegate = self
        inputParameters?.setValues()
    }
    
    func generateForecast(){
        let mapCenter = CLLocationCoordinate2D(latitude:AppModel.siteLat(),
                                               longitude:AppModel.siteLon())
        mainMap?.setCenter(mapCenter, animated: true)
        
    }

}

