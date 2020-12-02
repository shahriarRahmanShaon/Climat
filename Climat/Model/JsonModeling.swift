//
//  JsonModeling.swift
//  Climat
//
//  Created by sergio shaon on 2/12/20.
//

import Foundation
struct JsonModeling: Codable {
    let main : InternalObject
    let weather :[Weather]
}

struct InternalObject:Codable {
    let temp : Double
}

struct Weather : Codable {
    let id : Int
    let description : String
}
