//
//  PlayerList.swift
//  InfinitePlayerList
//
//  Created by Duc Minh Ngo on 2018-03-29.
//  Copyright © 2018 Duc Ngo. All rights reserved.
//

import UIKit

class PlayerList{
    
    var allPlayers = [Player]()
    
    let playerArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("players.archive")
    }()
    
        /*
    init(){
        for _ in 0..<25{
            createPlayer()
        }
    }
 
    */
    
    /*init(){
        if let archivedPlayers = NSKeyedUnarchiver.unarchiveObject(withFile: playerArchiveURL.path) as? [Player] {
        allPlayers = archivedPlayers
        }
    }
 */
    
    init(){
        var aPlayer = Player.init(name:"Lionel Messi", age:30, team:"Barcelona FC")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Cristiano Ronaldo", age: 33, team: "Real Madrid")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Robert Lewandowski", age: 29, team: "Bayern Munchen")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Giangiulini Buffon", age: 40, team: "Juventus FC")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Kevin De Bruyne", age: 26, team: "Manchester City")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Duc Ngo", age: 22, team: "Ottawa Fury")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Heung Min Son", age: 25, team: "Tottenham Hotspurs")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "David De Gea", age: 27, team: "Manchester United")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Pierre Emerick Aubameyang", age: 27, team: "Arsenal FC")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Usain Bolt", age: 40, team: "Borussia Dortmund")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Neymar", age: 24, team: "PSG")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Marco Veratti", age: 25, team: "Juventus FC")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Thiago Silva", age: 30, team: "PSG")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Mario Balotelli", age: 32, team: "OGC Nice")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Marcos Alonso", age: 24, team: "Chelsea FC")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Mohammed Salah", age: 29, team: "Liverpool FC")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Sadio Mane", age: 26, team: "Liverpool FC")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Andres Iniesta", age: 33, team: "Barcelona FC")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Christian Eriksen", age: 30, team: "Tottenham Hotspurs")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Eden Hazard", age: 29, team: "Chelsea")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Tony Kroos", age: 31, team: "Real Madrid")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Sergio Ramos", age: 32, team: "Real Madrid")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Kylian Mbappe", age: 18, team: "PSG")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Nicklas Bendtner", age: 32, team: "Rosenborg BK")
        allPlayers.append(aPlayer)
        
        aPlayer = Player.init(name: "Antoine Griezmann", age: 27, team: "Atletico Madrid")
        allPlayers.append(aPlayer)
    
        if let archivedPlayers = NSKeyedUnarchiver.unarchiveObject(withFile: playerArchiveURL.path) as? [Player] {
            allPlayers = archivedPlayers
        }

    }
    
    
    @discardableResult func createPlayer() -> Player {
        let newPlayer = Player(random: true)
        
        allPlayers.append(newPlayer)
        
        return newPlayer
    }
    
    
    func removePlayer(_ player: Player){
        if let index = allPlayers.index(of: player) {
            allPlayers.remove(at: index)
        }
    }
    
    func movePlayer(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex{
            return
        }
        
        //Get reference to object being moved so you can reinsert it
        let movedPlayer = allPlayers[fromIndex]
        
        //Remove soccer player from array
        allPlayers.remove(at: fromIndex)
        
        //Insert soccer player to array at new location
        allPlayers.insert(movedPlayer, at: toIndex)
        
    }
    
    func saveChanges() -> Bool {
        print("Saving players to: \(playerArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allPlayers, toFile: playerArchiveURL.path)
    }
 
    func imageURL(forKey key: String) -> URL {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.appendingPathComponent(key)
    }
    

}
