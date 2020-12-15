//
//  ViewController.swift
//  Climat
//
//  Created by sergio shaon on 6/11/20.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    @IBOutlet weak var uiImageview: UIImageView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var temperatureLebel: UILabel!
    
    var weatherApiObject = WeatherApiParsing()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherApiObject.delegate = self
        inputTextField.delegate = self
        // Do any additional setup after loading the view.
    }
}
//MARK:- textfield management
extension WeatherViewController : UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        weatherApiObject.urlString(cityName: inputTextField.text!)
        inputTextField.text = ""
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        inputTextField.backgroundColor = #colorLiteral(red: 0.4491788745, green: 0.6856242418, blue: 0.7035358548, alpha: 1)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if inputTextField.text != nil{
            return true
        }else{
            inputTextField.text = "Please type a city name!"
            return false
        }
    }
}
//MARK:- api parsing management
extension WeatherViewController : WeatherApiParsingDelegate{
    func didUpdateImageView(jsonModel: ConditionImage) {
        print(jsonModel.conditionImage)
        DispatchQueue.main.async {
            self.temperatureLebel.text = jsonModel.temperatureString
            self.uiImageview.image = UIImage(systemName: jsonModel.conditionImage)
        }
        
    }
    
    func didSeeError(error: Error) {
        print(error)
    }
    
}
//MARK:- location management
extension WeatherViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print("\(lat) & \(lon)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


