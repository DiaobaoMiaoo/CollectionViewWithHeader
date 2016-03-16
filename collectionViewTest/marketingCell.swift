//
//  marketingCell.swift
//  collectionViewTest
//
//  Created by Ke MA on 2016-03-11.
//  Copyright © 2016 Kemin. All rights reserved.
//

import UIKit

class marketingCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isAccessibilityElement = true
        
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.greenColor().CGColor
    }
}
