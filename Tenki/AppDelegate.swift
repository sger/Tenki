//
//  AppDelegate.swift
//  Tenki
//
//  Created by Spiros Gerokostas on 10/03/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import Cocoa
import CoreLocation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, CLLocationManagerDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let locationManager = CLLocationManager()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "--°"
        statusItem.action = #selector(AppDelegate.displayPopUp(_:))
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.distanceFilter = 1000
        locationManager.startUpdatingLocation()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
    @objc func displayPopUp(_ sender: AnyObject) {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier:
            NSStoryboard.SceneIdentifier(rawValue: "WeatherViewController")) as? WeatherViewController else {
            return
        }
        let popOver = NSPopover()
        popOver.contentViewController = vc
        popOver.behavior = .transient
        popOver.show(relativeTo: (statusItem.button?.bounds)!, of: statusItem.button!, preferredEdge: .maxY)
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
}

