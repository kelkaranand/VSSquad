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
     var eventTime: String
     var eventAddress: String
     var eventDescription: String
     
    //MARK: Initialization
        
    init?(eventID: String, eventName: String, eventDate: String, eventTime: String, eventAddress: String, eventDescription: String) {
           
           
           // Initialize stored properties.
           self.eventID = eventID
           self.eventName = eventName
           self.eventDate = eventDate
        self.eventTime = eventTime
           self.eventAddress = eventAddress
           self.eventDescription = eventDescription
           
       }
    
    
}
