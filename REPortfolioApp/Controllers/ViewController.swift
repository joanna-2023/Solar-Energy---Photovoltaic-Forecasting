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
    
    @IBOutlet var dayWeekMonth:UISegmentedControl?
    @IBOutlet var weatherForecastContainer:CustomContainerView?
    var weatherForecastVC:WeatherForecastViewController?
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pvSimulationAnalizer.baseURLRequest()
        inputParameters?.style()
        simulationOutput?.style()
        mainMap?.style()
        //forecastContainer?.style()
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

    @IBAction func dayWeekMonthlyWeatherViewChange(control:UISegmentedControl){
        print(control.selectedSegmentIndex)
        WeatherDataModel.selectedWeatherPeriod = control.selectedSegmentIndex
        weatherForecastVC?.updateForecast()
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "weather-view"{
            // Assign the weather forcast and update
            // the view in the above functions
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weather-view" {
            let controller = segue.destination as! WeatherForecastViewController
            weatherForecastVC = controller
        }
    }
}

