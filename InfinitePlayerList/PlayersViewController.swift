//
//  PlayersViewController.swift
//  InfinitePlayerList
//
//  Created by Duc Minh Ngo on 2018-03-28.
//  Copyright © 2018 Duc Ngo. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
  
    
    var playerList: PlayerList!
    
    @IBAction func addNewPlayer(_ sender: UIButton){
        // Make a new index path for the 0th section, last row
        //let lastRow = tableView.numberOfRows(inSection: 0)
        //let indexPath = IndexPath(row: lastRow, section: 0)
        
        //Insert this new row into the table
        //tableView.insertRows(at: [indexPath], with: .automatic)
        
        //Create a new player and add him to the list
        let newPlayer = playerList.createPlayer()
        
        //Figure out where that player is in the array
        if let index = playerList.allPlayers.index(of: newPlayer){
            let indexPath = IndexPath(row: index, section: 0)
            
            //insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton){
        //If you're in editing mode
        if isEditing {
            //change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            // turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            //enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int{
        return playerList.allPlayers.count
        
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create an instance of UITableViewCell, with default appearance
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        //Get a new or recycled cell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        
        //Set the text on the cell with the desription of the player
        //that is at the nth index of players, where n = row this cell
        //will appear in on the tableview
        let player = playerList.allPlayers[indexPath.row]
        
        //cell.textLabel?.text = player.name
        //cell.detailTextLabel?.text = "\(player.team)"
        
        //Configure the cell with the Player
        cell.nameLabel.text = player.name
        cell.teamLabel.text = player.team
        cell.ageLabel.text = String(player.age)
        
        return cell
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        //tableView.rowHeight = 65
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath){
        //If the table view is asking to commit a delete command
        if editingStyle == .delete{
            let player = playerList.allPlayers[indexPath.row]
            
            let title = "Remove \(player.name)?"
            let message = "Are you sure you want to remove this player from the list?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: { (action) -> Void in
                
                
                
                //Remove the player from the list
                self.playerList.removePlayer(player)
                
                //Also remove that row from the tble view with animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
            })
            ac.addAction(deleteAction)
            
            //Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath){
        //update the model
        playerList.movePlayer(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
 
 
    
}



//override func tableView(_ tableview: UITableView,
//                        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
// Create an instance of UITableViewCell, with default appearance
//    let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")

//Set the text on the cell with the description of the player
//that is at the nth index of players, where n = row this cell
//will appear in on the tableview
//    let player = playerList.allPlayers[indexPath.row]

//    cell.textLavel?.text = player.name
//    cell.detailTextLabel?.text = "$\(player.team)"

//    return cell
//}
