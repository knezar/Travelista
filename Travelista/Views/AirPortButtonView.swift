//
//  view.swift
//  latifaTravels
//
//  Created by C4Q on 7/28/19.
//  Copyright © 2019 FoodStepProject. All rights reserved.
//

import UIKit
protocol SampleButtonViewDelegate: class {
    func sampleButtonTapped(_ button: AirPortButtonView)
}

@IBDesignable class AirPortButtonView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var staticButtonView: UIButton!
    @IBOutlet weak var airportCodeButtonView: UIButton!
    @IBOutlet weak var cityButtonView: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    weak var delegate: SampleButtonViewDelegate?
    
    let nibName = "AirPortButtonView"

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
        let bundle = Bundle(for: AirPortButtonView.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setUpView()
    }
    
    private func setUpView(){
        staticButtonView.contentHorizontalAlignment = .left
        airportCodeButtonView.contentHorizontalAlignment = .left
        cityButtonView.contentHorizontalAlignment = .left
        if self.tag == 1 {
            staticButtonView.setTitle("To", for: .normal)
            imageView.setNeedsLayout()
            imageView.image = #imageLiteral(resourceName: "flight-takeoff-line")
//            imageView.sizeToFit()
        }
    }
    
    @IBAction func airButtonTapped(_ sender: UIButton) {
        delegate?.sampleButtonTapped(self)
    }
}
