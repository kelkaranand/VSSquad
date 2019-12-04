//
//  NavContainerViewController.swift
//  VSSquad
//
//  Created by Noah Flaniken on 11/14/19.
//  Copyright © 2019 Anand Kelkar. All rights reserved.
//

import UIKit

class NavContainerViewController: UIViewController {

    @IBOutlet weak var QRView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        QRView.layer.cornerRadius = QRView.layer.bounds.width / 2
        QRView.layer.masksToBounds = true
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
