//
//  Constants.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 20/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let BASE_URL = "https://swapi.co/api/"

let PERSON_URL = BASE_URL + "people/"
typealias PERSONCOMPLETION = (PersonDetails?) -> Void
typealias HOMEWORLDCOMPLETION = (HomeworldDetails?) -> Void
typealias VEHICLECOMPLETION = (VehicleDetails?) -> Void
typealias STARSHIPCOMPLETION = (StarshipDetails?) -> Void
typealias FILMCOMPLETION = (FilmDetails?) -> Void
