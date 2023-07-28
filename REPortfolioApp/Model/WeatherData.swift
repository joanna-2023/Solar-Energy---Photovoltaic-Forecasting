//
//  WeatherData.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-26.
//

import Foundation

//https://weatherstack.com/?utm_source=google&utm_medium=cpc&utm_campaign=weatherstack_search_us_ca&gclid=EAIaIQobChMI5Jiaot2sgAMVZM3CBB3vjgQuEAAYAiAAEgIiHfD_BwE

enum SelectedPeriod{
    case day;
    case week;
    case month;
    case year;
}

class WeatherData{
    var sampleData = Array<WeatherObservation>()
    static var selectedPeriod = SelectedPeriod.day
    static var selectedWeatherPeriod:Int = 0
    static var selectedDate = NSDate()
    
    func dataWeek(m:Int,
                         y:Int)->Array<WeatherObservation>{
        var result = Array<WeatherObservation>()
        for k in 1...7{
            var day = WeatherObservation()
            day.dayOfWeek = day.getDayOfWeek(m: m,y: y)
            result.append(day)
        }
        return result
    }
    
    func dataMonth(m:Int,
                         y:Int)->Array<WeatherObservation>{
        var result = Array<WeatherObservation>()
        for k in 1...30{
            var day = WeatherObservation()
            day.dayOfWeek = day.getDayOfWeek(m: m,y: y)
            result.append(day)
        }
        return result
    }
    
    func dataYear(m:Int,
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
