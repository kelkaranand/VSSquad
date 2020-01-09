//
//  EventsTableViewCell.swift
//  EventsViewControllerContainer
//
//  Created by Lisa Brown on 11/23/19.
//  Copyright © 2019 Lisa Brown. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var eventIdLabel: UILabel!
    
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventAddressLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
