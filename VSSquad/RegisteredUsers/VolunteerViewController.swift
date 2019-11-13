//
//  VolunteerViewController.swift
//  VSSquad
//
//  Created by Lisa Brown on 11/3/19.
//  Copyright © 2019 Lisa Brown. All rights reserved.
//

import UIKit

class VolunteeriewController: UIViewController, UITextFieldDelegate{
//MARK: Properties
    
    @IBOutlet weak var firstNameLabel: UITextField!
    
    @IBOutlet weak var lastNameLabel: UITextField!
    
    @IBOutlet weak var regEventsLabel: UITextField!
    
    @IBOutlet weak var memberSinceLabel: UITextField!
    
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var volunteer: Volunteer?
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        
        
    }


}


