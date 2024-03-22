# About
An about window.

## Usage
Use the view builder to add sections to the about window.  Dividers are automatically inserted between sections.
```swift
struct MyApp: App {
	var body: some Scene {
		About {
			MyCustomViewA()
			MyCustomViewB()
		}
	}
}
```

## About Window Options
```swift
About {
	/* ... */
}
.aboutWindowOptions(/* ... */) // <-- here!
```
| Option | Description |
| - | - |
| `.showDefaultInformation` | Show the default app information view at the top of the window, containing the app icon, name, and version. |
| `.showDefaultCopyright` | Show the default app copyright view at the bottom of the window.  The string used is the one found in Info.plist |

## Miscellaneous
The About window also supports the following options
- [App Icon Options](Sources/_MoreWindowsCommon/DOCUMENTATION.md#app-icon-options)
- [App Version Options](Sources/_MoreWindowsCommon/DOCUMENTATION.md#app-version-options)
