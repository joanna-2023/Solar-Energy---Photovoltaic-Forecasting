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

class WeatherDataModel{
    var dataLoader = WeatherDataLoader()
    var sampleData = Array<WeatherObservation>()
    static var selectedPeriod = SelectedPeriod.day
    static var selectedWeatherPeriod:Int = 0
    static var selectedDate = Date()
    let calendar = NSCalendar.current
    
    func loadWeatherForSelectedPeriod(){
        dataLoader.loadForecast()
    }
    
    func daysInMonth()->Int{
        let calendar = Calendar.current
        let date = Date()
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        print(numDays) // 31
        return numDays;
    }
    
    func allDaysInMonth()->Array<WeatherObservation>{
        var result = Array<WeatherObservation>()
        let totalDays = daysInMonth()
        print("total days in month: ", totalDays)
        //let day = calendar.component(Calendar.Component.day, from: WeatherData.selectedDate)
        let month = calendar.component(Calendar.Component.month, from: WeatherDataModel.selectedDate)
        let year = calendar.component(Calendar.Component.year, from: WeatherDataModel.selectedDate)
        for k in 1...totalDays{
            let dateComponents = NSDateComponents()
            dateComponents.day = k
            dateComponents.month = month
            dateComponents.year = year
            if let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian),
                let date = gregorianCalendar.date(from: dateComponents as DateComponents) {
                let wo = WeatherObservation()
                wo.rawDate = date
                wo.decomposeDate()
                result.append(wo)
            }
        }
        return result
    }
}

class WeatherObservation{
    var weather = "sunny"
    var temperature = 65
    var month = 7
    var year = 2023
    var dayOfMonth = 22
    var dayOfWeek = "Tue"
    var monthOfYear = "Jul"
    var rawDate:Date = Date()
    
    func decomposeDate(){
        let day = getDayOfMonth(date: rawDate)
        let month = getMonth(date: rawDate)
        let weekday = getDayOfWeek(date: rawDate)
        //
        dayOfMonth = day
        switch weekday{
        case 1:
            dayOfWeek = "Mon"
            break;
        case 2:
            dayOfWeek = "Tue"
            break;
        case 3:
            dayOfWeek = "Wed"
            break;
        case 4:
            dayOfWeek = "Thu"
            break;
        case 5:
            dayOfWeek = "Fri"
            break;
        case 6:
            dayOfWeek = "Sat"
            break;
        case 7:
            dayOfWeek = "Sun"
            break;
        default:
            break;
        }
        
        switch month{
        case 1:
            monthOfYear = "Jan"
            break;
        case 2:
            monthOfYear = "Feb"
            break;
        case 3:
            monthOfYear = "Mar"
            break;
        case 4:
            monthOfYear = "Apr"
            break;
        case 5:
            monthOfYear = "May"
            break;
        case 6:
            monthOfYear = "Jun"
            break;
        case 7:
            monthOfYear = "Jul"
            break;
        case 8:
            monthOfYear = "Aug"
            break;
        case 9:
            monthOfYear = "Sep"
            break;
        case 10:
            monthOfYear = "Oct"
            break;
        case 11:
            monthOfYear = "Nov"
            break;
        case 12:
            monthOfYear = "Dec"
            break;
        default:
            break;
        }
    }
    
    func getDayOfMonth(date:Date)->Int{
        let calendar = NSCalendar.current
        let components = calendar.component(Calendar.Component.day, from: date)
        return components
    }
    
    func getDayOfWeek(date:Date)->Int{
        let calendar = NSCalendar.current
        let components = calendar.component(Calendar.Component.weekday, from: date)
        return components
    }
    func getMonth(date:Date)->Int{
        let calendar = NSCalendar.current
        let components = calendar.component(Calendar.Component.month, from: date)
        return components
    }
}
