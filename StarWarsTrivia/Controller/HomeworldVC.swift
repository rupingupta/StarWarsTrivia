//
//  HomeworldVC.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 24/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController , PersonProtocol{
    var person: PersonDetails!  // auto added by conforming to the protocol
    
//var person: PersonDetails!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    let fetchHW = FetchHomeworldDetails()
    override func viewDidLoad() {
        print("inHomeVC : \(person.name)")
        super.viewDidLoad()

        fetchHW.fetchHomeworld(url: person.homeWorldURL) { (homeWorldObj) in
            if let homeWorldObj = homeWorldObj {
            self.setUpUI(homeworld: homeWorldObj)
        }
        }
    }
    
    func setUpUI(homeworld: HomeworldDetails){
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
   

}
