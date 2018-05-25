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
        return [CategoryModel.init(prefix: "John", firstname: "Wick", lastname: "Ray", state: "Queensland", address: "114 Harrison Street", country: "Australia"),
                CategoryModel.init(prefix: "John", firstname: "Snow", lastname: "Nothing", state: "South Australia", address: "114 Harrison Street", country: "Australia"),
                CategoryModel.init(prefix: "Graham", firstname: "John", lastname: "Brain", state: "Queensland", address: "114 Harrison Street", country: "Australia"),
                CategoryModel.init(prefix: "Robert", firstname: "Rogen", lastname: "Killer", state: "Australia", address: "114 Harrison Street", country: "Australia"),
                CategoryModel.init(prefix: "Mary", firstname: "Elizabeth", lastname: "Linda", state: "Queensland", address: "114 Harrison Street", country: "Australia"),
                CategoryModel.init(prefix: "Tabby", firstname: "Gabby", lastname: "Chabby", state: "Australia", address: "114 Harrison Street", country: "Australia")]
    }
    
    class func dynamicJsonResponse() -> [[String : [String : String]]] {
        
        return [
                [
                    "PersonalDetails" : [
                        "Prefix" : "John",
                        "Firstname" : "Wick",
                        "Lastname" : "Ray"
                    ],
                    "PersonalContact" : [
                        "State" : "Queensland",
                        "Address" : "114 Harrison Street",
                        "Country" : "Australia"
                    ]
                ],
                [
                    "PersonalDetails" : [
                        "Prefix" : "Graham",
                        "Firstname" : "Wick",
                        "Middlename" : "Jr",
                        "Lastname" : "Brain",
                        "Extra" : "NewColumn"
                    ],
                    "PersonalContact" : [
                        "State" : "Queensland",
                        "Address" : "114 Harrison Street",
                        "Country" : "Australia",
                        "Phone" : "3883838"
                    ]
                ],
                [
                    "PersonalDetails" : [
                        "Prefix" : "Mary",
                        "Firstname" : "Elizabeth",
                        "Middlename" : "Sr",
                        "Lastname" : "Linda"
                    ],
                    "PersonalContact" : [
                        "State" : "Queensland",
                        "Address" : "114 Harrison Street",
                        "Country" : "Australia",
                        "Phone" : "3883838"
                    ],
                    "OtherDetails" : [
                        "Role" : "Developer",
                        "Permission" : "Granted"
                    ]
                ]
            ]
        }

}
