//
//  dateButtonView.swift
//  latifaTravels
//
//  Created by C4Q on 7/28/19.
//  Copyright © 2019 FoodStepProject. All rights reserved.
//

import UIKit

@IBDesignable class DateButtonView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var staticButtonView: UIButton!
    @IBOutlet weak var monthButtonView: UIButton!
    @IBOutlet weak var dayButtonView: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    let nibName = "DateButtonView"
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        // load the nib file
        let bundle = Bundle(for: DateButtonView.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUpView()
    }
    
    private func setUpView(){
        staticButtonView.contentHorizontalAlignment = .left
        monthButtonView.contentHorizontalAlignment = .left
        dayButtonView.contentHorizontalAlignment = .left
        if self.tag == 1 {
            staticButtonView.setTitle("Return", for: .normal)
        }
    }
}
