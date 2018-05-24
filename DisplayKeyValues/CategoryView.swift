//
//  CategoryCustomView.swift
//  DisplayKeyValues
//
//  Created by Ghouse Basha Shaik on 23/05/18.
//  Copyright © 2018 Ratheesh Reddy. All rights reserved.
//

import UIKit

class CategoryView: UIView {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        connectNibUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print(keyLabel)
    }
}
extension UIView {
    func connectNibUI() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil)
        let nibView = nib.first as! UIView
        nibView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(nibView)
    }
}
