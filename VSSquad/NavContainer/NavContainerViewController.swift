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
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var myEventsView: UIView!
    @IBOutlet weak var addEventsView: UIView!
    @IBOutlet weak var searchEventsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        QRView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scanQR)))
        homeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goHome)))
        myEventsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewMyEvents)))
        addEventsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addEvent)))
        searchEventsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchEvents)))
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        QRView.layer.cornerRadius = QRView.layer.bounds.width / 2
        QRView.layer.masksToBounds = true
        
    }

    // MARK: Actions
    
    @objc func scanQR (){
        print("scanQR")
    }
    
    @objc func goHome(){
        print("goHome")
    }
    
    @objc func viewMyEvents(){
        print("viewMyEvents")
    }
    
    @objc func addEvent(){
        print("addEvent")
    }
    
    @objc func searchEvents(){
        print("searchEvents")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    

}
