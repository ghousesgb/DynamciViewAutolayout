//
//  CategoryViewController.swift
//  DisplayKeyValues
//
//  Created by Ghouse Basha Shaik on 23/05/18.
//  Copyright © 2018 Ratheesh Reddy. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    var mainScrollView: UIScrollView!
    var firstView = CategoryView.init()
    var previousView = CategoryView.init()
    
    let categoryModel = CategoryModel.categoryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIComponents()
    }

    func updateUIComponents() {
        
        mainScrollView = UIScrollView(frame: view.bounds)
        view.addSubview(mainScrollView)

        mainScrollView.translatesAutoresizingMaskIntoConstraints = false

        mainScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        mainScrollView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        mainScrollView.setNeedsLayout()
        
        for row in 0..<categoryModel.count {
            for column in 0..<categoryModel[row].count {
                let key   = categoryModel[row][column].key
                let value = categoryModel[row][column].value
                
                var size: CGSize = value.size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14.0)])
                if size.width < 120 {
                    size.width = 120
                }
                let newCustomView = CategoryView.init()

                mainScrollView.addSubview(newCustomView)
                newCustomView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    newCustomView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
                    newCustomView.widthAnchor.constraint(equalToConstant: size.width),
                    newCustomView.heightAnchor.constraint(equalToConstant: 80)])
                newCustomView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
                newCustomView.widthAnchor.constraint(equalToConstant: size.width).isActive = true
                newCustomView.heightAnchor.constraint(equalToConstant: 80).isActive = true
               
                if column == 0 {
                    newCustomView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
                    firstView = newCustomView
                    previousView = newCustomView
                }else {
                    newCustomView.leadingAnchor.constraint(equalTo: previousView.leadingAnchor).isActive = true
                    previousView = newCustomView
                }
                if column == categoryModel[row].count - 1 {
                    newCustomView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
                }

                newCustomView.keyLabel.text   = key
                newCustomView.valueLabel.text = value
                newCustomView.setNeedsLayout()
                mainScrollView.setNeedsLayout()
            }
        }
        mainScrollView.setNeedsDisplay()
        view.setNeedsDisplay()
    }
}
