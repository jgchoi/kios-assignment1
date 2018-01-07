//
//  CitiesTableViewController.swift
//  kios-assignment1
//
//  Created by Jung Geon Choi on 2018-01-07.
//  Copyright © 2018 Jung Geon Choi. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {
    var stores: [Store] = [] {
        didSet {
            self.getAllCitiesString()
            self.tableView.reloadData()
        }
    }
    var cities: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Store.getAllStores { (stores) in
            self.stores = stores
        }
    }
    
    func getAllCitiesString() {
        var result: [String:String] = [:]
        stores.forEach { (store) in
            result[store.city] = store.city
        }
        cities = Array(result.keys)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cities[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowStores", sender: cities[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StoresTableViewController {
            vc.city = sender as! String
            vc.stores = stores
        }
    }
}
