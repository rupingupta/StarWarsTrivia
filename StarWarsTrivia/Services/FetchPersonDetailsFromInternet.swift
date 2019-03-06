//
//  FetchPersonDetailsFromInternet.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 20/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class FetchPersonDetailsFromInternet {
    
    //making web request using Alamofire but using Codable to parse Json and populate PersonDetails Object This is the most used form
    
   
    func getRandomPersonUsingAlamofireAndCodable(id: Int, completionHandler: @escaping (PERSONCOMPLETION)) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else {
            completionHandler(nil)
            return
        }
        
        Alamofire.request(url).responseJSON { response in
            
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completionHandler(nil)
                return
            }
            
            guard let data = response.data else {
                completionHandler(nil)
                return
            }
            let jsonDec = JSONDecoder()
            do {
                //plz observe that we need not write any seperate method to parse json to populate our object...we just have implement protocol 'Codable' in our PersonDetails struct
           let person = try jsonDec.decode(PersonDetails.self, from: data)
                completionHandler(person)
            }
            catch{
                
            }
            
        }
        
        
        
    }
    
    
    //making Web Request using Alamofire and then parsing JSON using SwiftyJSON
    func getRandomPersonUsingAlamofireAndSwifty(id: Int, completionHandler: @escaping (PERSONCOMPLETION)) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else {
            completionHandler(nil)
            return
        }
        
        Alamofire.request(url).responseJSON { response in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completionHandler(nil)
                return
            }
            
            guard let data = response.data else {
                completionHandler(nil)
                return
            }
            
            do {
                let json = try JSON(data: data)
                let person = self.parseJsonResponseSwifty(json: json)
                completionHandler(person)
              
            }
            catch{
                completionHandler(nil)
                return
            }
            
        }
        
        
    }
    
    //pasring JSON using SwiftyJson as JSON object is getting passed to this funnction which is retrieved from SwiftyJson Library
    func parseJsonResponseSwifty(json : JSON) -> PersonDetails{
        print("insideSwiftyParsing")
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthyear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeWordURLs = json["homeworld"].stringValue
        let filmsURLs = json["films"].arrayValue.map({$0.stringValue})
        print("PrintingArrayFilms : \(filmsURLs)")
        let filmsURLs1 = json["films"].arrayValue.map({$0.stringValue})
        print("PrintingArrayFilms1 : \(filmsURLs1)")
        let vehiclesURLs = json["vehicles"].arrayValue.map({$0.stringValue})
        let starshipURLs = json["starships"].arrayValue.map({$0.stringValue})
        
    
        let person = PersonDetails(name: name, height: height, birthYear: birthyear, gender: gender, hair: hair, mass: mass, homeWorldURL: homeWordURLs, filmURLs: filmsURLs, vehicleURLs: vehiclesURLs, starshipURLs: starshipURLs)
        
        print("PrintingPersonComplete : \(person)")
        return person
    }
    
    
    //making Web Request using Alamofire (most generally used) but manual parsing (we wont be calling this function as Parsing using SwiftyJson is better)
    func getRandonPersonUsingAlamofire(id: Int, completionHandler: @escaping (PERSONCOMPLETION)) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else {
            return
        }
        
        Alamofire.request(url).responseJSON { response in
    
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completionHandler(nil)
                return
            }
            
            
            
            guard let jsonData = response.result.value as? [String: Any] else {
                completionHandler(nil)
                return
            }
            
            //
            
            
            
            //using manual parsing method to populate person object
            let person = self.parsePersonDetailsManual(json: jsonData)
            completionHandler(person)
        }
    }
    
    
   
    
    // making Web Request to fetch json data using URL Session, which we dont really use generally
    func getRandomPersonURLSession(id: Int, completionHandlerFunc : @escaping PERSONCOMPLETION) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else {
            completionHandlerFunc(nil)
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                debugPrint(error.debugDescription)
                completionHandlerFunc(nil)
                return
            }
            
            guard let data = data else {
                // completionHandlerFunc(nil)
                return
            }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else {
                  //  completionHandlerFunc(nil)
                    return
                }
                print("printingJSONResponse : \(json)")
                let person = self.parsePersonDetailsManual(json: json)
          //if we use the below statement directly then we get 'Main Thread Checker: UI API called on a background thread' error while trying to update UILabels
          //completionHandlerFunc(person)
                // so we use the below mentioned code to come back to the main Thread while calling completion()
                DispatchQueue.main.async {
                    completionHandlerFunc(person)
                }
            }
            catch{
                
            }
            
            
            
            
           // print("dataJSON : \(data)")
           // print("response : \(response)")
        }
        task.resume()
        
    }
    
    private func parsePersonDetailsManual(json : [String: Any]) -> PersonDetails {
        
        print("PrintingCompleteJSON")
        let name = json["name"] as? String ?? ""
        print("printingName : \(name)")
        let height = json["height"] as? String ?? ""
        print("printingHeight : \(height)")
        let mass = json["mass"] as? String ?? ""
        print("printingN : \(mass)")
        let hair = json["hair_color"] as? String ?? ""
        print("printingHair : \(hair)")
        let birthyear = json["birth_year"] as? String ?? ""
        print("printingBirthYear : \(birthyear)")
        let gender = json["gender"] as? String ?? ""
        print("printingGender : \(gender)")
        let homeWordURLs = json["homeworld"] as? String ?? ""
        print("printingURLS : \(homeWordURLs)")
        let filmsURLs = json["films"] as? [String] ?? [String]()   
        let vehiclesURLs = json["vehicles"] as? [String] ?? [String]()
        let starshipURLs = json["starships"] as? [String] ?? [String]()
        
        
        let person = PersonDetails(name: name, height: height, birthYear: birthyear, gender: gender, hair: hair, mass: mass, homeWorldURL: homeWordURLs, filmURLs: filmsURLs, vehicleURLs: vehiclesURLs, starshipURLs: starshipURLs)
        
        print("PrintingPersonComplete : \(person)")
        return person
    }
}
