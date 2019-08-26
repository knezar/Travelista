//
//  BottomCollectionViewCell.swift
//  latifaTravels
//
//  Created by C4Q on 7/20/19.
//  Copyright © 2019 FoodStepProject. All rights reserved.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bottomCollectionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override var isHighlighted: Bool {
        didSet {
            bottomCollectionLabel.textColor = isHighlighted ? UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1) : UIColor.getRGB(red: 130 , green: 130, blue: 130, alpha: 1)
            bottomCollectionLabel.font = isHighlighted ? UIFont.boldSystemFont(ofSize: 15) : UIFont.systemFont(ofSize: 13)
            bottomCollectionLabel.backgroundColor = isHighlighted ? UIColor.clear : UIColor.getRGB(red: 244, green: 247, blue: 254, alpha: 1)
            bottomCollectionLabel.layer.borderWidth = isHighlighted ? 2 : 0
            bottomCollectionLabel.layer.borderColor = isHighlighted ? UIColor.red.cgColor : UIColor.black.cgColor
            
        }
    }
    
    override var isSelected: Bool {
        didSet {
            bottomCollectionLabel.textColor = isSelected ? UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1) : UIColor.getRGB(red: 130 , green: 130, blue: 130, alpha: 1)
            bottomCollectionLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 15) : UIFont.systemFont(ofSize: 13)
            bottomCollectionLabel.backgroundColor = isSelected ? UIColor.clear : UIColor.getRGB(red: 244, green: 247, blue: 254, alpha: 1)
            bottomCollectionLabel.layer.borderWidth = isSelected ? 2 : 0
            bottomCollectionLabel.layer.borderColor = isSelected ? UIColor.red.cgColor : UIColor.black.cgColor
        }
    }

}
