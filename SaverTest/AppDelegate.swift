//
//  AppDelegate.swift
//
//  Created by Mirko Fetter on 25.10.16.
//  Copyright © 2016 grugru. All rights reserved.
//

// Test App for debugging the ScreenSaverView Code in Xcode

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    lazy var screenSaverView = ScreenSaverMinimalView(frame: NSZeroRect, isPreview: false)
    lazy var sheetController: ConfigureSheetController = ConfigureSheetController()

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        screenSaverView.frame = (window.contentView?.bounds)!;
        window.contentView?.addSubview(screenSaverView);
        
        NSApp.beginSheet(sheetController.window!, modalFor: window, modalDelegate: self, didEnd: nil, contextInfo: nil)
        print("yeah")
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

