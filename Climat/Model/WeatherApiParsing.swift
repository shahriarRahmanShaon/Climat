//
//  WeatherApiParsing.swift
//  Climat
//
//  Created by sergio shaon on 2/12/20.
//

import Foundation

protocol WeatherApiParsingDelegate {
    func didUpdateImageView (jsonModel:ConditionImage)
    func didSeeError (error:Error)
}


struct WeatherApiParsing {
    
    var delegate : WeatherApiParsingDelegate?
    
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=0e467e5c6beceddf2be0be537b297025&units=metric"
    func urlString (cityName : String){
        let urlForm = "\(url)&q=\(cityName)"
        jsonParse(urlToWorkWith: urlForm)
    }
    
    func jsonParse (urlToWorkWith: String){
        // create url
        if let url = URL(string: urlToWorkWith){
            // create url session
            let urlSession = URLSession(configuration: .default)
            // give urlSession a task
            let urlSessionTask = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didSeeError(error: error!)
                    return
                }else{
                    if let safeData = data{
                        let parsedData = dataModeling(data: safeData)
                        self.delegate?.didUpdateImageView(jsonModel: parsedData!)
                        
                        
                    }
                }
            }
            urlSessionTask.resume()
        }
        
    }
    
    func dataModeling( data: Data) -> ConditionImage?{
        let decoderObject = JSONDecoder()
        do {
            let result = try decoderObject.decode(JsonModeling.self , from: data)
            let weatherId = result.weather[0].id
            let conditionViewObj = ConditionImage(id: weatherId)
            return conditionViewObj
        } catch {
            self.delegate?.didSeeError(error: error)
            return nil
        }
    }
    
}
