//
//  CategoryModel.swift
//  DisplayKeyValues
//
//  Created by Ratheesh Reddy on 5/22/18.
//  Copyright © 2018 Ratheesh Reddy. All rights reserved.
//

import Foundation

class CategoryModel {
    let prefix : String
    let firstname : String
    let lastname : String
    let state : String
    let address : String
    let country : String
    
    
    
    
    init(prefix : String, firstname : String, lastname : String, state : String, address : String, country : String) {
        self.prefix = prefix
        self.firstname = firstname
        self.lastname = lastname
        self.state = state
        self.country = country
        self.address = address
    }
    
    class func categoryDataSource() -> [CategoryModel] {
        return [CategoryModel.init(prefix: "Mr", firstname: "Jon", lastname: "Snow", state: "PH", address: "114, Harrison, 114, Harrison,114, Harrison", country: "Edison"),
                CategoryModel.init(prefix: "Mrs", firstname: "Marry", lastname: "Stark", state: "PH", address: "114, Harrison", country: "Edison"),
                CategoryModel.init(prefix: "Mr", firstname: "Jon", lastname: "Snow", state: "PH", address: "114, Harrison", country: "Edison"),
                CategoryModel.init(prefix: "Mr", firstname: "Jon", lastname: "Snow", state: "PH", address: "114, Harrison", country: "Edison"),
                CategoryModel.init(prefix: "Mr", firstname: "Jon", lastname: "Snow", state: "PH", address: "114, Harrison", country: "Edison"),
                CategoryModel.init(prefix: "Mr", firstname: "Jon", lastname: "Snow", state: "PH", address: "114, Harrison", country: "Edison")]
    }
}
