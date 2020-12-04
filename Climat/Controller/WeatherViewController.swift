//
//  ViewController.swift
//  Climat
//
//  Created by sergio shaon on 6/11/20.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherApiParsingDelegate {

    
    @IBOutlet weak var uiImageview: UIImageView!
    @IBOutlet weak var inputTextField: UITextField!
    var weatherApiObject = WeatherApiParsing()
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherApiObject.delegate = self
        inputTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
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
    
    func didUpdateImageView(jsonModel: ConditionImage) {
        print(jsonModel.conditionImage)
        DispatchQueue.main.async {
            self.uiImageview.image = UIImage(systemName: jsonModel.conditionImage)
        }
        
    }
    
    func didSeeError(error: Error) {
        print(error)
    }
 
}

