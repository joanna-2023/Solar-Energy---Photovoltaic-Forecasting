
//
//  PVSimulationAnalysis.swift
//  Portfolio
//
//  Created by Joanna Nikolova on 2023-07-19.
//

import Foundation
import UIKit

class PVSimulationAnalysis: ObservableObject{
    
    // Implement as Singleton
    static let shared = PVSimulationAnalysis()
    
    //Photovoltic Estimation Data based on Location -
    func baseURLRequest(){
        
        //Define the base URL
        var baseURL = "https://joannanikolova2023.pythonanywhere.com"
        guard var urlComponents = URLComponents(string: baseURL) else{
            return print("error")
        }
        
        // Build the request - path and parameters
        //urlComponents.path.append("/mysite/pv")
        urlComponents.queryItems = [
                                    URLQueryItem(name: "coordinate-lat", value: "134"),
                                    URLQueryItem(name: "coordinate-long", value: "130"),
                                    URLQueryItem(name: "forecast-type", value: "daily"),
                                    URLQueryItem(name: "number of panels", value: "50"),
                                    URLQueryItem(name: "panels-model", value: "Solar Ltd")
        ]
        
        guard let url = urlComponents.url else{
            return print("cannot include compoenents and URL")
        }
        
        //This will return the PV estimate:
        
        // Make the API call
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

