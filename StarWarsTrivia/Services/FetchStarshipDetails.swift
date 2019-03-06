//
//  FetchStarshipDetails.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 25/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
////
//  FetchVehicleDetails.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 25/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import Foundation
import Alamofire


class FetchStarshipDetails{
    
    
    func fetchStarship(url: String, completionHandler : @escaping(STARSHIPCOMPLETION)) {
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
                completionHandler(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let starship = try jsonDecoder.decode(StarshipDetails.self, from: data)
                
                completionHandler(starship)
                return
            }
            catch{
                completionHandler(nil)
                return
            }
        }
    }
    
}

