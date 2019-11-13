//
//  UserTableViewCell.swift
//  VSSquad
//
//  Created by Lisa Brown on 11/3/19.
//  Copyright © 2019 Lisa Brown. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var regEvents: UILabel!
    @IBOutlet weak var memberSince: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
