//
//  AppDelegate.swift
//  utc-clock
//
//  Created by Spen on 21/10/2018.
//  Copyright © 2018 Spen Taylor. All rights reserved.
//

import Cocoa

extension Date {
    var currentUTCTimeZoneDate: String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: self)
    }
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system().statusItem(withLength: -1)
    var ticker: Timer!
    
    func updateTitle(newTitle: String) {
        statusItem.title = newTitle
    }
    
    func updateTime() {
        updateTitle(newTitle: "UTC:" + Date().currentUTCTimeZoneDate )
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // This item is display only.
        statusItem.highlightMode = false;
        
        updateTitle(newTitle: "UTC:--:--")
        ticker = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        ticker.invalidate()
    }


}

