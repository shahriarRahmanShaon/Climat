//
//  ConditionImage.swift
//  Climat
//
//  Created by sergio shaon on 2/12/20.
//

import Foundation
struct ConditionImage {
    var id : Int
    var  conditionImage : String{
        switch id {
        case 200...232:
            return "cloud.bold "
        case 300...321:
            return "cloud.drizzle "
        case 500...531:
            return "cloud.rain "
        case 600...622:
            return "cloud.snow "
        case 701...781:
            return "cloud.drizzle "
        case 801...804:
            return "cloud "
        default:
            return "sun.max"
        }

    }
}

