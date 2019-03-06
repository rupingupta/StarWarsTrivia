//
//  FetchHomeworldDetails.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 25/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import Foundation
import Alamofire


class FetchHomeworldDetails{
    
    
    func fetchHomeworld(url: String, completionHandler : @escaping(HOMEWORLDCOMPLETION)) {
        guard let url = URL(string: url) else {
            completionHandler(nil)
            return
        }
        
        Alamofire.request(url).responseJSON { (response) in
            
            
            if let error = response.result.error {
                completionHandler(nil)
                return
            }
            
            
            
            guard let data = response.data else {
                completionHandler(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let homeworld = try jsonDecoder.decode(HomeworldDetails.self, from: data)
                
                completionHandler(homeworld)
                return
            }
            catch{
                completionHandler(nil)
                return
            }
            }
        }

}
