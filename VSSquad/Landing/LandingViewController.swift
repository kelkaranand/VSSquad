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
            cell.mapView.setRegion(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000), animated: true)
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


