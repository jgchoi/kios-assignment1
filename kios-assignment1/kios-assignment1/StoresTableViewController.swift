//
//  StoresTableViewController.swift
//  kios-assignment1
//
//  Created by Jung Geon Choi on 2018-01-07.
//  Copyright © 2018 Jung Geon Choi. All rights reserved.
//

import UIKit

class StoresTableViewController: UITableViewController {
    var stores: [Store] = [] {
        didSet {
            storesFilteredByCity = stores.filter{ $0.city == city}
        }
    }
    var storesFilteredByCity: [Store] = []
    var city = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storesFilteredByCity.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreTableViewCell
        cell.configure(storesFilteredByCity[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowStoreDetail", sender: storesFilteredByCity[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StoreDetailsTableViewController {
            vc.store = sender as! Store
        }
    }
    

}
