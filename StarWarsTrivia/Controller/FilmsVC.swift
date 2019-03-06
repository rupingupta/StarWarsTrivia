//
//  FilmsVC.swift
//  StarWarsTrivia
//
//  Created by Rupin Gupta on 24/12/18.
//  Copyright © 2018 Rupin Gupta. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController , PersonProtocol{

    
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    @IBOutlet weak var crawlText: UITextView!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    
    @IBOutlet weak var producerLbl: UILabel!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    var person: PersonDetails!  // auto added by conforming to the protocol
    
    var currentFilm = 0
    var films = [String]()
    let fetchFilmObj = FetchFilmDetails()
    
    
    //var person: PersonDetails!
    override func viewDidLoad() {
        print("inFilmsVC : \(person.name)")
        super.viewDidLoad()
        films = person.filmURLs
        let firstFilm = films.first!
        fetchFilmDetails(url: firstFilm)
        prevBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        
        
        
    }
    
    
    
    func fetchFilmDetails(url: String){
        fetchFilmObj.fetchFilms(url: url) { (filmDetails) in
            guard let filmDetails = filmDetails else {
                return
            }
            self.setUpUI(film: filmDetails)
        }
    }
    
    func setUpUI(film: FilmDetails){
        titleLbl.text = film.title
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releaseDateLbl.text = film.releaseDate
        crawlText.text = film.crawl
    }
    
    func setUpButtons() {
        prevBtn.isEnabled = currentFilm == 0 ? false : true
        nextBtn.isEnabled = currentFilm < films.count - 1 ? true : false
        fetchFilmDetails(url: films[currentFilm])
    }
    
    @IBAction func prevClicked(_ sender: Any) {
        
        currentFilm -= 1
        setUpButtons()
        
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        currentFilm += 1
        setUpButtons()
        
    }
    

 
 }
