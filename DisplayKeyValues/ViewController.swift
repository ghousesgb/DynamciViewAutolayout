//
//  ViewController.swift
//  DisplayKeyValues
//
//  Created by Ratheesh Reddy on 5/21/18.
//  Copyright © 2018 Ratheesh Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let categoryModel = CategoryModel.categoryDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? CustomCollectionViewLayout {
            layout.delegate = self
        }
    }
}

extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  categoryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       let itemscount = categoryModel[section].count
        return itemscount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CategoryCollectionViewCell
        let category = categoryModel[indexPath.section][indexPath.row]
        
        cell?.keyLabel.text = category.key
        cell?.valueLabel.text = category.value
        
        return cell!
    }
}



extension ViewController : CustomCollectionViewLayoutDelegate
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        var size = (categoryModel[indexPath.section][indexPath.row].value as NSString).size(withAttributes: nil)
        size.height = 80
        if size.width < 120 {
            size.width = 120
        }
        return size //CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
