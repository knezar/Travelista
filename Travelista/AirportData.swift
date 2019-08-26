//
//  ClientAPI.swift
//  latifaTravels
//
//  Created by Nezar Khabar on 7/28/19.
//  Copyright © 2019 FoodStepProject. All rights reserved.
//

import UIKit

class AirportData {
    public var airportCode : String?
    public var airportName : String?
    
    required public init(dictionary: [String:Any?]) {
        airportCode = dictionary["value"] as? String
        airportName = dictionary["label"] as? String
    }
}
