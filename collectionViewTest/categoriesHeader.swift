//
//  categoriesHeader.swift
//  collectionViewTest
//
//  Created by Ke MA on 2016-03-11.
//  Copyright © 2016 Kemin. All rights reserved.
//

import UIKit

class categoriesHeader: UICollectionReusableView {
    
    @IBOutlet weak var topPicksCV: UICollectionView!
    @IBOutlet weak var Marketing: UICollectionView!
    @IBOutlet weak var topPicksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.topPicksCV.isAccessibilityElement = false
        self.Marketing.isAccessibilityElement = false
    }
}
