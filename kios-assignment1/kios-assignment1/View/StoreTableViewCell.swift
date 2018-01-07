//
//  StoreTableViewCell.swift
//  kios-assignment1
//
//  Created by Jung Geon Choi on 2018-01-07.
//  Copyright © 2018 Jung Geon Choi. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    func configure(_ store: Store) {
        nameLabel.text = store.name
        addressLabel.text = store.address_line_1
        phoneNumberLabel.text = store.telephone
    }
}
