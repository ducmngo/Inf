//
//  DetailViewController.swift
//  InfinitePlayerList
//
//  Created by Duc Minh Ngo on 2018-04-26.
//  Copyright © 2018 Duc Ngo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var teamField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var player:Player!
    
    let ageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = player.name
        //ageField.text = String(player.age)
        ageField.text = ageFormatter.string(from: NSNumber(value: player.age))
        teamField.text = player.team
        dateLabel.text = dateFormatter.string(from: player.dateCreated)
        
    }
    
}
