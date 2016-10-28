

import ScreenSaver

class DefaultsManager {
    
    var defaults: UserDefaults
    
    init() {
        let identifier = Bundle(for: DefaultsManager.self).bundleIdentifier
        defaults = ScreenSaverDefaults.init(forModuleWithName: identifier!)!
    }
    
    var canvasColor: NSColor {
        set(newColor) {
            setColor(newColor, key: "CanvasColor")
        }
        get {
            return getColor("CanvasColor") ?? NSColor(red: 1, green: 0.0, blue: 0.5, alpha: 1.0)
        }
    }

    func setColor(_ color: NSColor, key: String) {
        defaults.set(NSKeyedArchiver.archivedData(withRootObject: color), forKey: key)
        defaults.synchronize()
    }

    func getColor(_ key: String) -> NSColor? {
        if let canvasColorData = defaults.object(forKey: key) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: canvasColorData) as? NSColor
        }
        return nil;
    }

        
}
