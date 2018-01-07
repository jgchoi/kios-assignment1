//
//  Store.swift
//  kios-assignment1
//
//  Created by Jung Geon Choi on 2018-01-07.
//  Copyright © 2018 Jung Geon Choi. All rights reserved.
//


import Foundation
import SwiftyJSON

class Store {
    var address_line_1 = ""
    var city = ""
    var postal_code = ""
    var telephone = ""
    var name = ""
    var inventory_count = 0
    var products_count = 0
    
    static func getAllStores(closure:@escaping (([Store]) -> Void)) {
        API.getStores { (response) in
            closure(parseJson(response))
        }
    }
    
    private static func parseJson(_ response: JSON) -> [Store] {
        var result: [Store] = []
        if let storesJson = response["result"].array {
            storesJson.forEach({ (storeJson) in
                result.append(Store(storeJson))
            })
        }
        return result
    }
    
    private init() {}
    private init(_ json: JSON) {
        address_line_1 = json["address_line_1"].stringValue
        city = json["city"].stringValue
        postal_code = json["postal_code"].stringValue
        telephone = json["telephone"].stringValue
        name = json["name"].stringValue
        inventory_count = json["inventory_count"].intValue
        products_count = json["products_count"].intValue
    }
}
