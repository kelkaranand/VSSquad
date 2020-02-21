//
//  CollectionViewCell.swift
//  VSSquad
//
//  Created by Anand Kelkar on 21/02/20.
//  Copyright © 2020 Anand Kelkar. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventAddress: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
}
