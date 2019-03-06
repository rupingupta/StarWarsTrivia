//
//  ViewController.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 19/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var massLbl: UILabel!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var birthYearLbl: UILabel!
    
    
    @IBOutlet weak var homeworldBtn: ButtonStyling!
    
    @IBOutlet weak var vehicleBtn: ButtonStyling!
    
    @IBOutlet weak var filmsBtn: ButtonStyling!
    
    @IBOutlet weak var starshipsBtn: ButtonStyling!
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var person: PersonDetails!
    
    
    @IBOutlet weak var hairLbl: UILabel!
    
    var personUrl = FetchPersonDetailsFromInternet()
    override func viewDidLoad() {
       
        
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func randomPersonClicked(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        
        spinner.startAnimating()
        personUrl.getRandomPersonUsingAlamofireAndCodable(id: random) { (person) in
            self.spinner.stopAnimating()
            if let person = person {
//                print("yay PersonFetchedSuccessfully")
//                print(person.name)
                self.setUpView(person: person)
                self.person = person
            }
        }
    }
    
    
    func setUpView (person: PersonDetails) {
        self.nameLbl.text = person.name
        self.heightLbl.text = person.height
        self.massLbl.text = person.mass
        self.birthYearLbl.text = person.birthYear
        self.genderLbl.text = person.gender
        self.hairLbl.text = person.hair
        print("PrintingPreson : \(person)")
        homeworldBtn.isEnabled = !person.homeWorldURL.isEmpty
        vehicleBtn.isEnabled = !person.vehicleURLs.isEmpty
        starshipsBtn.isEnabled = !person.starshipURLs.isEmpty
        filmsBtn.isEnabled = !person.filmURLs.isEmpty
    }

    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if var destination = segue.destination as? PersonProtocol {
            destination.person = self.person
        }
        
        
        //Using Switch and Enum
//        switch segue.identifier {
//        case Segue.films.rawValue :
//            if let destination = segue.destination as? FilmsVC {
//                destination.person = self.person
//            }
//        case Segue.starships.rawValue :
//            if let destination = segue.destination as? StarshipsVC {
//                destination.person = self.person
//            }
//        case Segue.vehicles.rawValue :
//            if let destination = segue.destination as? VehicleVC {
//                destination.person = self.person
//            }
//        case Segue.homeworld.rawValue :
//            if let destination = segue.destination as? HomeworldVC {
//                destination.person = self.person
//            }
//        default:
//            break
//        }
        
//        enum Segue: String {
//            case films = "filmsSegue"
//            case homeworld = "homeWorldSegue"
//            case starships = "starShipsSegue"
//            case vehicles = "vehiclesSegue"
//        }
//
        //simplest way, but for beginners
//        if segue.identifier == "filmsSegue" {
//            if let destination = segue.destination as? FilmsVC {
//                destination.person = self.person
//            }
//        }
//        if segue.identifier == "starShipsSegue" {
//            if let destination = segue.destination as? StarshipsVC {
//                destination.person = self.person
//            }
//        }
//        if segue.identifier == "vehiclesSegue" {
//            if let destination = segue.destination as? VehicleVC {
//                destination.person = self.person
//            }
//        }
//        if segue.identifier == "homeWorldSegue" {
//            if let destination = segue.destination as? HomeworldVC {
//                destination.person = self.person
//            }
//        }
//
        
      
    }

}

//this is a protocol that has been created here and implemented in every VC that needs the person details from thisVC to itself
protocol PersonProtocol {
    var person: PersonDetails! {get set}
}
