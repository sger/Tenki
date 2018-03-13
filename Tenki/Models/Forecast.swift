//
//  Forecast.swift
//  Tenki
//
//  Created by Spiros Gerokostas on 13/03/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import Cocoa
import SwiftyJSON

public class Forecast: NSObject {
    let latitude: Float
    let longitude: Float
    
    public required init(json: JSON) {
        self.latitude = json["longitude"].floatValue
        self.longitude = json["longitude"].floatValue
        super.init()
    }
}
