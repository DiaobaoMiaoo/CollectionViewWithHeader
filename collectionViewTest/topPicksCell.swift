//
//  topPicksCell.swift
//  collectionViewTest
//
//  Created by Ke MA on 2016-03-11.
//  Copyright © 2016 Kemin. All rights reserved.
//

import UIKit

class topPicksCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isAccessibilityElement = true
    }
}
