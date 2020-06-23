//
//  ScreenSaverMinimalView.swift
//  ScreenSaverMinimal
//
//  Created by Mirko Fetter on 28.10.16.
//
// Based on https://github.com/erikdoe/swift-circle


import ScreenSaver

class ScreenSaverMinimalView : ScreenSaverView {
    
    lazy var sheetController: ConfigureSheetController = ConfigureSheetController()
   
    
    override init(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)!
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override var hasConfigureSheet: Bool {
        return true
    }
    
    override var configureSheet: NSWindow? {
        return sheetController.window
    }

    
    override func startAnimation() {
        super.startAnimation()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    

    override func draw(_ rect: NSRect) {
        let bPath:NSBezierPath = NSBezierPath(rect: bounds)
        Preferences.canvasColor.nsColor.set()
        bPath.fill()
    }
    
    override func animateOneFrame() {
        window!.disableFlushing()
        
        window!.enableFlushing()
    }
}
    

