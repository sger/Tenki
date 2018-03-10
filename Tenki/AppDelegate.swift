//
//  AppDelegate.swift
//  Tenki
//
//  Created by Spiros Gerokostas on 10/03/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "--°"
        statusItem.action = #selector(AppDelegate.displayPopUp(_:))
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
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
}

