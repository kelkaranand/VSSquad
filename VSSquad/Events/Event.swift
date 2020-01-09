//
//  Event.swift
//  ViewControllerContainment
//
//  Created by Lisa Brown on 11/20/19.
//  Copyright © 2019 Lisa Brown. All rights reserved.
//

import UIKit

class Event {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    //MARK: Properties
     
     var eventID: String
     var eventName: String
     var eventDate: String
     var eventAddress: String
     
    //MARK: Initialization
        
     init?(eventID: String, eventName: String, eventDate: String, eventAddress: String) {
           
           
           // Initialize stored properties.
           self.eventID = eventID
           self.eventName = eventName
           self.eventDate = eventDate
           self.eventAddress = eventAddress
           
       }
    
    
}
