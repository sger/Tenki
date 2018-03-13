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
    let icon: String
    
    let temperature: String
    let celsius: String
    
    let dateString: String
    
    public required init(json: JSON) {
        self.latitude = json["longitude"].floatValue
        self.longitude = json["longitude"].floatValue
        let currently = json["currently"]
        print(currently)
        self.temperature = currently["temperature"].stringValue
        self.icon = currently["icon"].stringValue
        let temperature = currently["temperature"].intValue
        self.celsius = String(Int(round(Float(temperature - 32) * 5.0 / 9.0)))
        //print(Int(round(Float(test - 32) * 5.0 / 9.0))) // celsius
        //print(Int(round(Float(test) * 9.0 / 5.0)) + 32) // Fahr
    
        let unixDate = currently["time"].doubleValue
        let date = Date(timeIntervalSince1970: unixDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd YYYY hh:mm a"
        self.dateString = dateFormatter.string(from: date)
        super.init()
    }
}
