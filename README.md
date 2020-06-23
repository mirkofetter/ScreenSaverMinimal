# ScreenSaverMinimal

Template to create a macOS screen saver using Swift 5 (forked from https://github.com/mirkofetter/ScreenSaverMinimal with some code taken from Aerial https://github.com/JohnCoates/Aerial).

This project can be used as a starting point to create a macOS screen saver using Swift, as, as of Xcode 12 beta1, Apple only provides a template in Xcode for Objective-C screen savers. 

Please note that according to Apple, Swift screen savers are only officially supported as of macOS 14.6. There are **many** issues using Swift for screensavers on previous macOS versions (as an example, textfields won't work on High Sierra) so while you can support older versions, be aware there are many pitfalls. 

The template includes two targets, one that creates a usable `.saver`, and a test target that lets you quickly develop your screen saver without installing. 

# About Catalina, Big Sur, .plugin and .appex

Starting with Catalina, the screen saver API is (in some aspects) deprecated, using the old (unsafe) plugin format. Most first party Apple screen savers are using a new App Extension format that, as of writing this, does not seem to be available yet to 3rd parties. 

Prior to Catalina, when compiling a screen saver as a `.saver`, you are compiling a plugin that will be used by either `Screen Saver Engine` or `System Preferences`, and run in their memory space. 

Starting with Catalina, your `.saver` will be a plugin to a system file called `legacyScreenSaver.appex` which itself is an extension to either `Screen Saver Engine` or `System Preferences`. 

There are two major implications to this, the first one is that your screen saver will run in a sandbox (for example, instead of `~/Library/Application Support`, this path will point to `~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Application Support`). The second one is that your interactions with the system will be limited by `legacyScreenSaver.appex` entitlements. As of macOS 11 Big Sur, those are the current entitlements : 

```
com.apple.private.xpc.launchd.per-user-lookup
com.apple.security.app-sandbox
com.apple.security.cs.disable-library-validation
com.apple.security.files.user-selected.read-only
com.apple.security.network.client
com.apple.security.network.server
com.apple.security.temporary-exception.files.absolute-path.read-only
com.apple.security.temporary-exception.mach-lookup.global-name
com.apple.CARenderServer
com.apple.CoreDisplay.master
com.apple.nsurlstorage-cache
com.apple.ViewBridgeAuxiliary
com.apple.security.temporary-exception.sbpl
(allow mach-lookup mach-register)
com.apple.security.temporary-exception.yasb
```

Couple of examples of things you can't do, override the keyboard or read files outside of the system disk. 
