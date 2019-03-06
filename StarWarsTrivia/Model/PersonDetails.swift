//
//  PersonDetails.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 20/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import Foundation


struct PersonDetails : Codable {
    var name: String
    var height: String
    var birthYear: String
    var gender: String
    var hair: String
    var mass: String
    var homeWorldURL: String
    var filmURLs: [String]
    var vehicleURLs: [String]
    var starshipURLs: [String]
    
    // we are overriding this so we have to include all the properties and specify properties which will be different in the received Json Response
    enum CodingKeys : String, CodingKey {
        case name
        case height
        case birthYear = "birth_year"
        case gender
        case hair = "hair_color"
        case mass
        case homeWorldURL = "homeworld"
        case filmURLs = "films"
        case vehicleURLs = "vehicles"
        case starshipURLs = "starships"
    }
}
