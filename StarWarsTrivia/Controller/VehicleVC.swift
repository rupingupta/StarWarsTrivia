//
//  VehicleVC.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 24/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import UIKit

class VehicleVC: UIViewController , PersonProtocol{
    
    
    
  
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var modelLbl: UILabel!
    
    @IBOutlet weak var prevBtn: ButtonStyling!
    
    @IBOutlet weak var nextBtn: ButtonStyling!
    
    
    var person: PersonDetails!  // auto added by conforming to the protocol
    
    let fetchVehicle = FetchVehicleDetails()
    var currevtVehicle = 0
    
    var vehicleUrls = [String]()
  
    //var person: PersonDetails!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        vehicleUrls = person.vehicleURLs
        
        
        prevBtn.isEnabled = false
        
        nextBtn.isEnabled = vehicleUrls.count > 1 ? true : false
        
        guard let firstUrl = vehicleUrls.first else {
            return
        }
        fetchVechicleDetails(url: firstUrl)
        
        
       
    }

    func fetchVechicleDetails(url: String){
        fetchVehicle.fetchVehicle(url: url) { (vehicle) in
            guard let vehicle = vehicle else {
                return
            }
            self.setUpUi(vehicle: vehicle)
        }
    }
    
    
    func setUpUi(vehicle: VehicleDetails) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
    }
    
    
    func enableDisableButtons(){
        
        prevBtn.isEnabled = currevtVehicle > 0 ? true : false
        nextBtn.isEnabled = currevtVehicle < vehicleUrls.count - 1 ? true : false
        fetchVechicleDetails(url: vehicleUrls[currevtVehicle])
    }
    @IBAction func prevClicked(_ sender: Any) {
        currevtVehicle -= 1
        enableDisableButtons()
        
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        currevtVehicle += 1
        enableDisableButtons()
    }
}

