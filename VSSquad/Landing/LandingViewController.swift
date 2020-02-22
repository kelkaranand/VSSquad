//
//  LandingViewController.swift
//  VSSquad
//
//  Created by Anand Kelkar on 21/02/20.
//  Copyright © 2020 Anand Kelkar. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class LandingViewController : UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var easterEggView = UIImageView(image: UIImage.gifImageWithName("hp"))
    
    var showTime = false
    
    override func viewDidLoad() {
        super .viewDidLoad()
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showHarry))
        longPress.minimumPressDuration = 3
        welcomeLabel.addGestureRecognizer(longPress)
        easterEggView.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        self.view.bringSubviewToFront(easterEggView)
        let height = self.view.bounds.height*0.18
        let width = self.view.bounds.width*0.3
        easterEggView.frame = CGRect(x:0, y:0, width: width, height: height)
        self.view.addSubview(easterEggView)
        easterEggView.center.y = self.view.bounds.height - height/2
        easterEggView.center.x = -200
    }
    
    @objc func showHarry() {
        if(!showTime) {
            print("here")
            showTime = true
            UIView.animate(withDuration: 3, delay: 0.4, options: [.curveEaseOut],
                           animations: {
                            self.easterEggView.center.x = self.view.bounds.width + 200
            },completion: {
                (finished : Bool) in
                self.easterEggView.center.x = -200
                self.showTime = false
            })
        }
    }
    
    
}

extension LandingViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.layer.shouldRasterize = false
        cell.layer.borderWidth = 2

        
        let address = "1111 Polaris Parkway, Columbus, Ohio, 43240"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            let location = CLLocation(latitude: lat!,longitude: lon!)
            cell.mapView.setRegion(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000), animated: false)
            let pin = MKPointAnnotation()
            pin.title = address
            pin.coordinate = location.coordinate
            cell.mapView.addAnnotation(pin)
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
}

extension LandingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width * 0.85 , height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}


