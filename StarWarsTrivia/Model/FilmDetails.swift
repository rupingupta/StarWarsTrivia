//
//  FilmDetails.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 27/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import Foundation


struct FilmDetails: Codable {
    let title: String
    let director: String
    let producer: String
    let releaseDate: String
    let crawl: String
    
    
    
    
    
    enum CodingKeys : String, CodingKey {
        case title
        case director
        case producer
        case releaseDate = "release_date"
        case crawl = "opening_crawl"
       
    }
}
