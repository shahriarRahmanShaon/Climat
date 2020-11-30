//
//  WeatherFetching.swift
//  Climat
//
//  Created by sergio shaon on 28/11/20.
//

import Foundation

struct WeatherFetching {
    let apiurl = "https://api.openweathermap.org/data/2.5/weather?appid=0e467e5c6beceddf2be0be537b297025"
    func weatherUrl ( cityName: String){
        var url = "\(apiurl)&q=\(cityName)"
        fetchData(urlString: url)
    }
    
    func fetchData(urlString : String){
        if let url = URL(string: urlString){
            let urlSession = URLSession(configuration: .default)
            let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                }
            }
            dataTask.resume()
        }
        
    }
    
    //create url - done
    // create url session
    //give this url session a task
    // resume the task
    
}
