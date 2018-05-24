//
//  CategoryModel.swift
//  DisplayKeyValues
//
//  Created by Ratheesh Reddy on 5/22/18.
//  Copyright © 2018 Ratheesh Reddy. All rights reserved.
//

import Foundation

class CategoryModel {
    let key : String
    let value : String
    
    init(key : String, value : String) {
        self.key = key
        self.value = value
    }
    
    class func categoryDataSource() -> [[CategoryModel]] {
        return [[CategoryModel.init(key: "FName", value: "John"),
                CategoryModel.init(key: "MName", value: "Wick"),
                CategoryModel.init(key: "LName", value: "Rey"),
                CategoryModel.init(key: "FName", value: "John"),
                CategoryModel.init(key: "MName", value: "Wick"),
                CategoryModel.init(key: "LName", value: "Rey")]]
                /*
                [CategoryModel.init(key: "Age", value: "29"),
                CategoryModel.init(key: "Phone", value: "3938399283"),
                CategoryModel.init(key: "Address", value: "4001 Dutchmans Ln, St Matthews, KY 40207, USA"),
                CategoryModel.init(key: "Age", value: "29"),
                CategoryModel.init(key: "Phone", value: "3938399283"),
                CategoryModel.init(key: "Address", value: "4001 Dutchmans Ln, St Matthews, KY 40207, USA")]
               ]*/
    }
}
