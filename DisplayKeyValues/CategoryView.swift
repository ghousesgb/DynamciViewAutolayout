//
//  CategoryCustomView.swift
//  DisplayKeyValues
//
//  Created by Ratheesh Reddy on 5/23/18.
//  Copyright © 2018 Ratheesh Reddy. All rights reserved.
//

import UIKit

class CategoryView: UIView {

    @IBOutlet weak var prefixLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        connectNibUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var categoryModel : CategoryModel? {
        didSet {
            prefixLabel.text = categoryModel?.prefix
            firstNameLabel.text = categoryModel?.firstname
            lastNameLabel.text = categoryModel?.lastname
            stateLabel.text = categoryModel?.state
            addressLabel.text = categoryModel?.address
            countryLabel.text = categoryModel?.country
        }
    }
}
extension UIView {
    func connectNibUI() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil)
        let nibView = nib.first as! UIView
        //nibView.translatesAutoresizingMaskIntoConstraints = false
        nibView.frame = bounds
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(nibView)
    }
}
