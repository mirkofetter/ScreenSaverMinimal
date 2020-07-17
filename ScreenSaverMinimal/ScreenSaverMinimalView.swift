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
    var isPreviewBug: Bool = false
    
    override init(frame: NSRect, isPreview: Bool) {
        // Radar# FB7486243, legacyScreenSaver.appex always returns true, unlike what used
        // to happen in previous macOS versions, see documentation here : https://developer.apple.com/documentation/screensaver/screensaverview/1512475-init$

        var preview = true

        // We can workaround that bug by looking at the size of the frame
        // It's always 296.0 x 184.0 when running in preview mode
        if frame.width > 400 && frame.height > 300 {
            if isPreview {
                isPreviewBug = true
            }
            preview = false
        }
        
        super.init(frame: frame, isPreview: preview)!
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

        // This is the debug view
        let debugTextView = NSTextView(frame: bounds.insetBy(dx: 20, dy: 20))
        debugTextView.font = .labelFont(ofSize: 30)
        debugTextView.string += "Radar# FB7486243 (isPreview bug) : \(isPreviewBug) \n"
        
        self.addSubview(debugTextView)

    }
    
    override func animateOneFrame() {
        window!.disableFlushing()
        
        window!.enableFlushing()
    }
}
    

