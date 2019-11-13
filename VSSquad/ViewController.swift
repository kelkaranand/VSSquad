//
//  ViewController.swift
//  VSSquad
//
//  Created by Lisa Brown on 10/16/19.
//  Copyright © 2019 Lisa Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var UsernameField: UITextField!
    
    @IBOutlet weak var Password: UILabel!
    @IBOutlet weak var PasswordField: UITextField!
    
    //MARK: Action
    
   @IBAction func Login(_ sender: UIButton) {
  }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "ShowUserSegue"
        {
          if segue.destination is volunteer2TableViewController {
    
           }
      }
    }

}

