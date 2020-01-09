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
    
    //LJ Comment
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Tap on screen to dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    //MARK: Action
    
    @IBAction func login(_ sender: UIButton) {
        if UsernameField.text!.isEmpty || PasswordField.text!.isEmpty {
            let alertController = UIAlertController(title: "Warning", message:
                "Please enter Username & Password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))

            self.present(alertController, animated: true, completion: nil)
            
        }
       else {
            self.performSegue(withIdentifier: "NavContainerSegue", sender:  self)
        }
    }
    
}

