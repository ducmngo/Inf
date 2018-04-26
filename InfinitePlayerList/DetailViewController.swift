//
//  DetailViewController.swift
//  InfinitePlayerList
//
//  Created by Duc Minh Ngo on 2018-04-23.
//  Copyright © 2018 Duc Ngo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var teamField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        //If the device has a camera, take a picture; otherwise, pick from photo library
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        
        //Place image picker on the scree
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var player:Player! {
        didSet {
            navigationItem.title = player.name
        }
    }
    
    var imageStore: ImageStore!
    
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
        
        //Clear first responder
        view.endEditing(true)
        
        nameField.text = player.name
        //ageField.text = String(player.age)
        ageField.text = ageFormatter.string(from: NSNumber(value: player.age))
        teamField.text = player.team
        dateLabel.text = dateFormatter.string(from: player.dateCreated)
        
        //Get the playerKey
        let key = player.playerKey
        
        //If there is an associated image with the player, display it on image view
        let imageToDisplay = imageStore.image(forKey: key)
        imageView.image = imageToDisplay
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // "Save" changes to player info
        player.name = nameField.text ?? ""
        player.team = teamField.text ?? ""
        if let ageText = ageField.text,
            let age = ageFormatter.number(from: ageText){
            player.age = age.intValue
        } else {
            player.age = 0
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //Get selected image from info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Store the image in ImageStore for the item's key
        imageStore.setImage(image, forKey: player.playerKey)
        
        //Put that image on the screen in the image view
        imageView.image = image
        
        //Take image picker off the screen - must call this dismiss method
        dismiss(animated: true, completion: nil)
    }
    
}
