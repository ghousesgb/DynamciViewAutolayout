//
//  CategoryViewController.swift
//  DisplayKeyValues
//
//  Created by Ratheesh Reddy on 5/23/18.
//  Copyright © 2018 Ratheesh Reddy. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    var mainScrollView: UIScrollView!
    let categoryModel = CategoryModel.categoryDataSource()
    let jsonModel = CategoryModel.dynamicJsonResponse()
    var previousView = CategoryView()
    var previousDynamicView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //updateUIComponents()
        updateDynamicUIComponents()
    }
    
    func updateUIComponents() {
        mainScrollView = UIScrollView(frame: view.bounds)
        view.addSubview(mainScrollView)
        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.isPagingEnabled = true
        mainScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant : 80).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.heightAnchor.constraint(equalToConstant: 154).isActive = true
        mainScrollView.setNeedsLayout()
        
        for row in 0..<categoryModel.count {
            
            let newCustomView = CategoryView.init()
            newCustomView.backgroundColor = UIColor.white

            mainScrollView.addSubview(newCustomView)
        
            newCustomView.translatesAutoresizingMaskIntoConstraints = false
            newCustomView.anchor(top: mainScrollView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: mainScrollView.frame.size.width, height: 154))
        
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
    
    func updateDynamicUIComponents() {
        mainScrollView = UIScrollView(frame: view.bounds)
        view.addSubview(mainScrollView)
        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.isPagingEnabled = true
        mainScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant : 80).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.setNeedsLayout()
        var previousDynamicHeight = 0
        for row in 0..<jsonModel.count {
            let personAllDetailsArray = jsonModel[row]
            let dynamicHeight = 77 * personAllDetailsArray.count //counting number of rows
            let mainScrollViewHeightAnchor = mainScrollView.heightAnchor.constraint(equalToConstant: CGFloat(dynamicHeight))
            mainScrollViewHeightAnchor.priority = UILayoutPriority(rawValue: 749)
            
            if previousDynamicHeight < dynamicHeight {
                previousDynamicHeight = dynamicHeight
                mainScrollViewHeightAnchor.priority = UILayoutPriority(rawValue : 1000)
            }
            mainScrollViewHeightAnchor.isActive = true

            let newCustomView = UIView()
            newCustomView.backgroundColor = UIColor.white
            
            mainScrollView.addSubview(newCustomView)
            
            newCustomView.translatesAutoresizingMaskIntoConstraints = false
            newCustomView.anchor(top: mainScrollView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: mainScrollView.frame.size.width, height: CGFloat(dynamicHeight)))
            
            if row == 0 {
                newCustomView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
                previousDynamicView = newCustomView
            }else {
                newCustomView.leadingAnchor.constraint(equalTo: previousDynamicView.trailingAnchor).isActive = true
                previousDynamicView = newCustomView
            }
            if row == jsonModel.count - 1 {
                newCustomView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
            }
            constructPersonalDetails(customView: newCustomView, jsonData: personAllDetailsArray)
            mainScrollView.setNeedsLayout()
            /*newCustomView.backgroundColor = UIColor.yellow
            if row % 2 == 0 {
                newCustomView.backgroundColor = UIColor.red
            }*/
        }
    }
    
    func constructPersonalDetails(customView : UIView, jsonData : [String : [String : String]]) {
        var previousHeader = UILabel.init()
        var previousTitleLabel = UILabel.init()
        var previousDetailLabel = UILabel.init()
        var row = 0
        for personDetails in jsonData {
            print(personDetails.key)
            let headerLabel = UILabel.init()
            headerLabel.textColor = UIColor.white
            headerLabel.backgroundColor = UIColor.black
            headerLabel.text = personDetails.key
            customView.addSubview(headerLabel)
            if row == 0 {
                headerLabel.anchor(top: customView.topAnchor, leading: customView.leadingAnchor, bottom: nil, trailing: customView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: customView.frame.size.width, height: 21))
            }else {
                headerLabel.anchor(top: previousDetailLabel.bottomAnchor, leading: customView.leadingAnchor, bottom: nil, trailing: customView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: customView.frame.size.width, height: 21))
            }
            previousHeader = headerLabel
            var column = 0
            for subDetails in personDetails.value {
                //column = 0
                let width = self.view.frame.size.width / CGFloat(personDetails.value.count)
                let titleLabel = UILabel.init()
                let detailLabel = UILabel.init()
                titleLabel.text = subDetails.key
                detailLabel.text = subDetails.value
                
                customView.addSubview(titleLabel)
                customView.addSubview(detailLabel)

                if column == 0 {
                    titleLabel.anchor(top: headerLabel.bottomAnchor, leading: customView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: width, height: 21))
                    detailLabel.anchor(top: titleLabel.bottomAnchor, leading: customView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: width, height: 21))
                    
                }else {
                    titleLabel.anchor(top: headerLabel.bottomAnchor, leading: previousTitleLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: width, height: 21))
                    detailLabel.anchor(top: titleLabel.bottomAnchor, leading: previousDetailLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: width, height: 21))
                    
                }
                if column == personDetails.value.count - 1{
                    titleLabel.anchor(top: headerLabel.bottomAnchor, leading: previousTitleLabel.trailingAnchor, bottom: nil, trailing: headerLabel.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: width, height: 21))
                    detailLabel.anchor(top: titleLabel.bottomAnchor, leading: previousDetailLabel.trailingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: width, height: 21))
                }
                previousTitleLabel = titleLabel
                previousDetailLabel = detailLabel
                column = column + 1
            }
            
            
            row = row + 1
            
        }
    }
}




















