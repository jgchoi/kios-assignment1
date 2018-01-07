//
//  StoreDetailsTableViewController.swift
//  kios-assignment1
//
//  Created by Jung Geon Choi on 2018-01-07.
//  Copyright © 2018 Jung Geon Choi. All rights reserved.
//

import UIKit

class StoreDetailsTableViewController: UITableViewController {
    var store: Store!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var inventoryCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate func setupUI() {
        title = store.name
        nameLabel.text = store.name
        addressLabel.text = store.address_line_1
        cityLabel.text = store.city
        postalCodeLabel.text = store.postal_code
        telephoneLabel.text = store.telephone
        productCountLabel.text = store.products_count.description
        inventoryCountLabel.text = store.inventory_count.description
        tableView.tableFooterView = UIView()
    }
}
