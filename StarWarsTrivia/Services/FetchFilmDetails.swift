//
//  FetchFilmDetails.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 27/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import Foundation
import Alamofire


class FetchFilmDetails{ func fetchFilms(url: String, completionHandler: @escaping (FILMCOMPLETION)) {
    
    guard let url = URL(string: url) else {
        completionHandler(nil)
        return
    }
    
    
    Alamofire.request(url).responseJSON { (response) in
        
        if let error = response.result.error {
            debugPrint(error.localizedDescription)
            completionHandler(nil)
            return
        }
        
        
        
        guard let data = response.data else {
            return
        }
        
        
        let jsonDecoder = JSONDecoder()
        
        
        do {
            let film = try jsonDecoder.decode(FilmDetails.self, from: data)
            completionHandler(film)
        }
        
        catch{
            return
        }
        
        
        
    }
    
}
}
