//
//  CollectionViewCell.swift
//  latifaTravels
//
//  Created by C4Q on 7/16/19.
//  Copyright © 2019 FoodStepProject. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topButtonLabelView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isHighlighted: Bool {
        didSet {
            topButtonLabelView.textColor = isHighlighted ? UIColor.white : UIColor.getRGB(red: 130 , green: 130, blue: 130, alpha: 1)
            topButtonLabelView.font = isHighlighted ? UIFont.boldSystemFont(ofSize: 17) : UIFont.systemFont(ofSize: 16)
            topButtonLabelView.backgroundColor = isHighlighted ? UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1) : UIColor.clear
        }
    }
    
    override var isSelected: Bool {
        didSet {
            topButtonLabelView.textColor = isSelected ? UIColor.white : UIColor.getRGB(red: 130 , green: 130, blue: 130, alpha: 1)
            topButtonLabelView.font = isSelected ? UIFont.boldSystemFont(ofSize: 17) : UIFont.systemFont(ofSize: 15)
            topButtonLabelView.backgroundColor = isSelected ? UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1) : UIColor.clear
        }
    }
}
