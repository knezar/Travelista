//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by    Ankit on 20/10/17.
//  Copyright © 2017 Ankit. All rights reserved.
//

import UIKit

class DaysCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var daysLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override var isHighlighted: Bool {
        didSet {
            daysLabel.textColor = isHighlighted ? UIColor.white : UIColor.getRGB(red: 130 , green: 130, blue: 130, alpha: 1)
            daysLabel.font = isHighlighted ? UIFont.boldSystemFont(ofSize: 18) : UIFont.systemFont(ofSize: 13)
            daysLabel.backgroundColor = isSelected ? UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1) : UIColor.clear
        }
    }
    
    override var isSelected: Bool {
        didSet {
            daysLabel.textColor = isSelected ? UIColor.white : UIColor.getRGB(red: 130 , green: 130, blue: 130, alpha: 1)
            daysLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 18) : UIFont.systemFont(ofSize: 13)
            daysLabel.backgroundColor = isSelected ? UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1) : UIColor.clear
        }
    }
    
}
