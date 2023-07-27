//
//  WeatherData.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-26.
//

import Foundation

//https://weatherstack.com/?utm_source=google&utm_medium=cpc&utm_campaign=weatherstack_search_us_ca&gclid=EAIaIQobChMI5Jiaot2sgAMVZM3CBB3vjgQuEAAYAiAAEgIiHfD_BwE

class WeatherObservation{
    var weather = "sunny"
    var temperature = 65
    var month = 7
    var year = 2023
    var dayOfWeek = "Tue"
    var monthOfYear = "Jul"
    
    func getDayOfWeek(m:Int,
                      y:Int)->String{
        return "Mon"
    }
    func getMonthInYear(m:Int,
                      y:Int)->String{
        return "July"
    }
}

class WeatherData{
    var sampleData = Array<WeatherObservation>()
    
    
    func sampleDataWeek(m:Int,
                         y:Int)->Array<WeatherObservation>{
        var result = Array<WeatherObservation>()
        for k in 1...7{
            var day = WeatherObservation()
            day.dayOfWeek = day.getDayOfWeek(m: m,y: y)
            result.append(day)
        }
        return result
    }
    
    func sampleDataMonth(m:Int,
                         y:Int)->Array<WeatherObservation>{
        var result = Array<WeatherObservation>()
        for k in 1...30{
            var day = WeatherObservation()
            day.dayOfWeek = day.getDayOfWeek(m: m,y: y)
            result.append(day)
        }
        return result
    }
    
    func sampleDataYear(m:Int,
                         y:Int)->Array<WeatherObservation>{
        var result = Array<WeatherObservation>()
        for k in 1...12{
            var day = WeatherObservation()
            day.dayOfWeek = day.getDayOfWeek(m: m,y: y)
            result.append(day)
        }
        return result
    }
    
}
