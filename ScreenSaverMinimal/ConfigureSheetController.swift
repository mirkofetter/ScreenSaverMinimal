//
//  ConfigureSheetController.swift
//  ScreenSaverMinimal
//
//  Created by Mirko Fetter on 28.10.16.
//
//  Based on https://github.com/erikdoe/swift-circle
//
//  Updated for Swift 5 / Catalina / Big Sur by Guillaume Louel 23/06/20


import Cocoa

class ConfigureSheetController : NSObject {
    
    var defaultsManager = DefaultsManager()

    @IBOutlet var window: NSWindow?
    @IBOutlet var canvasColorWell: NSColorWell?


    override init() {
        super.init()
        let myBundle = Bundle(for: ConfigureSheetController.self)
        myBundle.loadNibNamed("ConfigureSheet", owner: self, topLevelObjects: nil)
        canvasColorWell!.color = defaultsManager.canvasColor
    }

    @IBAction func updateDefaults(_ sender: AnyObject) {
        defaultsManager.canvasColor = canvasColorWell!.color
    }
   
    @IBAction func closeConfigureSheet(_ sender: AnyObject) {
        NSColorPanel.shared.close()
        NSApp.endSheet(window!)
    }
}
