//
//  StarshipsVC.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 24/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController , PersonProtocol{
    
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var modelLbl: UILabel!
    
    
    
    @IBOutlet weak var previousClicked: ButtonStyling!
    
    
    @IBOutlet weak var nextClicked: ButtonStyling!
    
    
    
    //    @IBOutlet weak var nameLbl: UILabel!
//
//    @IBOutlet weak var modelLbl: UILabel!
//
//    @IBOutlet weak var costLbl: UILabel!
//
//    @IBOutlet weak var lengthLbl: UILabel!
//    @IBOutlet weak var makerLbl: UILabel!
//
//    @IBOutlet weak var maxSpeedLbl: UILabel!
   // @IBOutlet weak var nextButton: UIButton!
    
    
    
   // @IBOutlet weak var prevButton: ButtonStyling!
    
    
//    @IBOutlet weak var passengersLbl: UILabel!
//    @IBOutlet weak var crewLbl: UILabel!
    
    var person: PersonDetails!  // auto added by conforming to the protocol
    
    
    let starship = FetchStarshipDetails()
    var starshipsURLs = [String]()
    var currentStarship = 0
    
    //var person: PersonDetails!
    override func viewDidLoad() {
        print("inStarShipsVC : \(person.name)")
        super.viewDidLoad()
        
        
      
        starshipsURLs = person.starshipURLs
        print("beforeDiable")
        previousClicked.isEnabled = false
        print("afterDisable")
        nextClicked.isEnabled = starshipsURLs.count > 1 ? true : false
        
        guard let firstUrl = starshipsURLs.first else {
            return
        }
        fetchStarships(url: firstUrl)
        

        
    }
    
    
    func fetchStarships(url: String) {
        starship.fetchStarship(url: url) { (starship1) in
           guard let startship1 = starship1 else{
            return
            }
            self.setUpUi(starship: starship1!)
        }
    }
    
    
    func setUpUi(starship : StarshipDetails) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
//        makerLbl.text = starship.maker
//        costLbl.text = starship.cost
//        lengthLbl.text = starship.length
//        crewLbl.text = starship.crew
//        passengersLbl.text = starship.passengers
//        maxSpeedLbl.text = starship.maxSpeed
    }
    
    
    
    
    
    func enableDisableButtons(){
        previousClicked.isEnabled = currentStarship < 1 ? false : true
        nextClicked.isEnabled = currentStarship < starshipsURLs.count - 1 ? true : false
        
        fetchStarships(url: starshipsURLs[currentStarship])
    }
    
    
  
    
    @IBAction func prevButtonClicked(_ sender: Any) {
        
        currentStarship -= 1
        enableDisableButtons()
    }
    
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        currentStarship += 1
        enableDisableButtons()
    }
    
   
}
