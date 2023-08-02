//
//  WeatherDataLoader.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-08-02.
//

import Foundation

//REQUIRES FREE WEATHER API or hide - use only for information for PVLIB

class WeatherDataLoader{
    
    static var accessKey = "025ac73465ffec8b94e8bd0f3eabb8eb"
    static var query = "Tucson"
    
    func loadForecast(period:String="week"){
       
        var baseURL = "https://api.weatherstack.com/forecast"
        guard var urlComponents = URLComponents(string: baseURL) else{
            return print("error")
        }
        
        // Build the request - path and parameters
        //urlComponents.path.append("/mysite/pv")
        urlComponents.queryItems = [
            URLQueryItem(name: "access_key", value: WeatherDataLoader.accessKey),
            URLQueryItem(name: "query", value: WeatherDataLoader.query),
            URLQueryItem(name: "forecast_days", value: String(1)),
            URLQueryItem(name: "hourly", value: String(1))
        ]
        
        guard let url = urlComponents.url else{
            return print("cannot include compoenents and URL")
        }
        
        //This will return the PV estimate:
        
        // Make the API call
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                guard error == nil, let data = data else {
                    print("No weather data received:", error ?? URLError(.badServerResponse))
                    return
                }

                do {
                    //Parse data here -
                    print("weather data received:",
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
