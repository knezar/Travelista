//
//  PassengerView.swift
//  latifaTravels
//
//  Created by C4Q on 7/29/19.
//  Copyright © 2019 FoodStepProject. All rights reserved.
//

import UIKit

@IBDesignable class PassengerView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passengerLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    
    var adultNumber = 1
    var chidrenNumber = 0
    let nibName = "PassengerView"
    
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
        let bundle = Bundle(for: PassengerView.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUpView()
    }
    
    private func setUpView(){
        if self.tag == 0 {
            counterLabel.text = String(adultNumber)
        } else {
            counterLabel.text = String(chidrenNumber)
            titleLabel.text = ""
            passengerLabel.text = "Children"
            discriptionLabel.text = "1-12 years"
        }
    }
    
    @IBAction func UpButton(_ sender: UIButton) {        
        if self.tag == 0 {
            if adultNumber < 9 {
                adultNumber += 1
                counterLabel.text = String(adultNumber)
            }
        } else if self.tag == 1{
            if chidrenNumber < 9 {
                chidrenNumber += 1
                counterLabel.text = String(chidrenNumber)
            }
        }
    }
    
    @IBAction func downButton(_ sender: UIButton) {
        if self.tag == 0 {
            if adultNumber > 1 {
                adultNumber -= 1
                counterLabel.text = String(adultNumber)
            }
            
        } else if self.tag == 1 {
            if chidrenNumber > 0 {
                chidrenNumber -= 1
                counterLabel.text = String(chidrenNumber)
            }
        }
    }
    
}
