
//
//  PVSimulationAnalysis.swift
//  Portfolio
//
//  Created by Desi Nikolova on 2023-07-19.
//

import Foundation
import UIKit

class PVSimulationAnalysis: ObservableObject{
    
    // Implement as Singleton
    static let shared = PVSimulationAnalysis()
    
    //Photovoltic Estimation Data based on Location -
    func baseURLRequest(){
        
        //Define the base URL
        
        // LOCAL:
        // http://127.0.0.1:5000/energyGeneration
        
    
        let baseURL = "https://jane2023.pythonanywhere.com/"//"http://127.0.0.1:5000/energyGeneration"
        guard var urlComponents = URLComponents(string: baseURL) else{
            return print("error")
        }
        
        // Build the request - path and parameters
        //urlComponents.path.append("/mysite/pv")
        
        let l = NSNumber(value: AppModel.siteLatitude)
        let lg = NSNumber(value: AppModel.siteLongitude)
        let nm = NSNumber(value: AppModel.modulesNum)
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: l.stringValue),
            URLQueryItem(name: "long", value: lg.stringValue),
            URLQueryItem(name: "numModules", value: nm.stringValue),
            URLQueryItem(name: "siteName", value: AppModel.siteName),
            URLQueryItem(name: "gmtZone", value: AppModel.siteGMTZone)
        ]
        
        guard let url = urlComponents.url else{
            return print("cannot include compoenents and URL")
        }
        
        //This will return the PV estimate:
        
        // Make the API call
        print("query to remote python API:", url)
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                guard error == nil, let data = data else {
                    print("No data received:", error ?? URLError(.badServerResponse))
                    return
                }

                do {
                    //Parse data here -
                    print("data received",
                          data)
                    let stringResponse = String(data: data, encoding: .utf8)
                    print(String(data: data, encoding: .utf8))
                } catch let parseError {
                    print("Parsing error:",
                          parseError,
                          String(describing: String(data: data, encoding: .utf8)))
                }
            }
        }
        task.resume()
    }
}

