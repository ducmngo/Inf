//
//  Player.swift
//  InfinitePlayerList
//
//  Created by Duc Minh Ngo on 2018-03-28.
//  Copyright © 2018 Duc Ngo. All rights reserved.
//



import UIKit
class Player: NSObject{
    var name: String
    var team: String
    var age: Int
    var dateCreated: Date
    
    
    
    //Designated initializer
    init(name: String, age: Int, team: String){
        self.name = name
        self.team = team
        self.age = age
        self.dateCreated = Date()
        
        super.init()
        
    }
    
    
     
    //Convenience initializer
    convenience init(random: Bool = false){
        if random {
            let firstName = ["Lionel", "David", "Mario", "Alex", "Marcus", "Robert", "Harry", "Christian", "Philippe", "Jack"]
            let lastName = ["Messi", "Lewandowski", "Gomez", "Goetze", "Balotelli", "Lacazette", "Alaba", "Kane", "Eriksen", "Davidson", "Thomas"]
            
            
            let teams = [ "Barcelona FC","Bayern Munchen","Real Madrid", "Heibei China Fortune", "West Ham United", "Atletico Madrid", "Manchester City", "Tottenham Hotspurs", "Barcelona FC", "OGC Nice", "Bayern Munchen", "Paris Saint Germain", "Tottenham Hotspurs", "Ottawa Fury","Liverpool FC","Liverpool FC", "Manchester City", "Arsenal FC", "Manchester United", "Paris Saint Germain", "Bayern Munchen", "Barcelona FC", "Rosenborg BK", "Borussia Dortmund", "Retired"]

            
            var idx = arc4random_uniform(UInt32(firstName.count))
            
            let randomFirstName = firstName[Int(idx)]

            idx = arc4random_uniform(UInt32(lastName.count))
            let randomLastName = lastName[Int(idx)]
            
            idx = arc4random_uniform(UInt32(teams.count))
            
            
            let randomName = "\(randomFirstName) \(randomLastName)"
            let randomAge = Int(arc4random_uniform(50))
            let randomTeam = teams[Int(idx)]
            
            
            self.init(name: randomName,
                      age: randomAge,
                      team: randomTeam)
        } else {
            self.init(name: "", age: 0, team: "")
        }
    }
 
 
 
}

