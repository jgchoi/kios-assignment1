//
//  API.swift
//  kios-assignment1
//
//  Created by Jung Geon Choi on 2018-01-07.
//  Copyright © 2018 Jung Geon Choi. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class API {
  static let baseUrl = "https://lcboapi.com/"
  static let ACCESS_KEY = "Token MDoxOTgwYjg1Yy1mM2QzLTExZTctYjU0Ni1lYjA4ZTQyOTEwYzg6NlNWM1Zxb2F5QXRScmRYeWQzclBiVGVCQW1sQjZHRllUVzg3"
    
    static func getStores(page: Int = 1, closure:@escaping ((JSON) -> Void)) {
    var headers = HTTPHeaders()
    headers = ["Authorization": ACCESS_KEY]
    
    Alamofire.request(baseUrl + "stores?per_page=100&page=\(page)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
      .responseJSON { response in
        closure(JSON(response.result.value!))
    }
  }
}
