//
//  HomeworldDetails.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 25/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import Foundation


struct HomeworldDetails: Codable {
    
    //please note : the names of the variables in the struct already match with the names in JSON response for Homworls URLs..so we need ont create an enum for this
    let name: String
    let climate: String
    let terrain: String
    let population: String
}
