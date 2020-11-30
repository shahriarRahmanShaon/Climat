//
//  ViewController.swift
//  Climat
//
//  Created by sergio shaon on 6/11/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var weatherObject = WeatherFetching()
    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputField.endEditing(true)
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        inputField.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = inputField.text {
            weatherObject.weatherUrl(cityName: city)
        }
        inputField.text = ""
    }
    
 
}

