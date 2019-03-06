//
//  StarshipDetails.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 25/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import Foundation


struct StarshipDetails: Codable {
    let name: String
    let model: String
    let maker: String
    let cost: String
    let length: String
    let maxSpeed: String
    let crew: String
    let passengers: String
    
    enum CodingKeys : String, CodingKey {
        case name
        case model
        case maker = "manufacturer"
        case cost = "cost_in_credits"
        case length
        case maxSpeed = "max_atmosphering_speed"
        case crew
        case passengers
    }
    
    
}

