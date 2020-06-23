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
    
    @IBOutlet var window: NSWindow?
    @IBOutlet var canvasColorWell: NSColorWell!


    override init() {
        super.init()
        let myBundle = Bundle(for: ConfigureSheetController.self)
        myBundle.loadNibNamed("ConfigureSheet", owner: self, topLevelObjects: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Do your UI init here!
        canvasColorWell.color = Preferences.canvasColor.nsColor
    }

    @IBAction func updateDefaults(_ sender: AnyObject) {
        Preferences.canvasColor = Color(nsColor: canvasColorWell!.color)
    }
   
    @IBAction func closeConfigureSheet(_ sender: AnyObject) {
        // Remember to close anything else first
        NSColorPanel.shared.close()

        // Now close the sheet (this works on older macOS versions too)
        window?.sheetParent?.endSheet(window!)
        
        // Remember, you are still in memory at this point until you get killed by parent.
        // If your parent is System Preferences, you will remain in memory as long as System
        // Preferences is open. Reopening the sheet will just wake you up.
        //
        // An unfortunate side effect of this is that if your user updates to a new version with
        // System Preferences open, they will see weird things (ui from old version running
        // new code, etc), so tell them not to do that!
    }
}
