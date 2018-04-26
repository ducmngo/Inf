//
//  Player.swift
//  InfinitePlayerList
//
//  Created by Duc Minh Ngo on 2018-03-28.
//  Copyright © 2018 Duc Ngo. All rights reserved.
//



import UIKit
class Player: NSObject, NSCoding{
    var name: String
    var team: String
    var age: Int
    var dateCreated: Date
    let playerKey: String
    
    
    
    //Designated initializer
    init(name: String, age: Int, team: String){
        self.name = name
        self.team = team
        self.age = age
        self.dateCreated = Date()
        self.playerKey = UUID().uuidString
        
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
 
    func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey:"name")
        aCoder.encode(dateCreated, forKey:"dateCreated")
        aCoder.encode(playerKey, forKey:"playerKey")
        aCoder.encode(team, forKey: "team")
        aCoder.encode(age, forKey:"age")
    }
 
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        playerKey = aDecoder.decodeObject(forKey:"playerKey") as! String
        team = aDecoder.decodeObject(forKey: "team") as! String
        age = aDecoder.decodeInteger(forKey: "age")
        
        super.init()
    }
 
}

