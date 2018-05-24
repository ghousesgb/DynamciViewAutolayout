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
    let categoryModel = CategoryModel.categoryDataSource()
    var previousView = CategoryView()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUIComponents()
    }
    
    func updateUIComponents() {
        mainScrollView = UIScrollView(frame: view.bounds)
        view.addSubview(mainScrollView)
        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.isPagingEnabled = true
        mainScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant : 50).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.heightAnchor.constraint(equalToConstant: 175).isActive = true
        mainScrollView.setNeedsLayout()
        
        for row in 0..<categoryModel.count {
            
            let newCustomView = CategoryView.init()
            if row % 2 == 0 {
                newCustomView.backgroundColor = UIColor.yellow
            }else {
                newCustomView.backgroundColor = UIColor.red
            }
                mainScrollView.addSubview(newCustomView)
            
                newCustomView.translatesAutoresizingMaskIntoConstraints = false
                newCustomView.anchor(top: mainScrollView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: mainScrollView.frame.size.width, height: 175))
            
                if row == 0 {
                    newCustomView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
                    previousView = newCustomView
                }else {
                    newCustomView.leadingAnchor.constraint(equalTo: previousView.trailingAnchor).isActive = true
                    previousView = newCustomView
                }
                if row == categoryModel.count - 1 {
                    newCustomView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
                }
                newCustomView.categoryModel = categoryModel[row]
                mainScrollView.setNeedsLayout()
            }
        mainScrollView.setNeedsDisplay()
        view.setNeedsDisplay()
        }
}
