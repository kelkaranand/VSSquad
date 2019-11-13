//
//  Volunteer.swift
//  VSSquad
//
//  Created by Lisa Brown on 11/3/19.
//  Copyright © 2019 Lisa Brown. All rights reserved.
//

import UIKit

class Volunteer {
    
    //MARK: Properties
    
    var firstName: String
    var lastName: String
    var regEvents: String
    var memberSince: String
    
   //MARK: Initialization
       
    init?(firstName: String, lastName: String, regEvents: String, memberSince: String) {
          
          
          // Initialize stored properties.
          self.firstName = firstName
          self.lastName = lastName
          self.regEvents = regEvents
          self.memberSince = memberSince
          
      }
    }
    
