## App Icon Options
Any scenes or views that contain `AppIconView` support this environment variable.
```swift
Launcher {
	/* ... */
}
.appIconOptions(/* ... */) // <-- here!
```
| Option | Description |
| - | - |
| `.glowInTheDark` | Apply a faint glow behind the icon when the system is in dark mode. |
| `.hoverScale` | Increase the scale of the app icon with a hover interaction. |
| `.hoverRotation` | Slightly tilt the app icon based on cursor position with a hover interaction. |
| `.hoverShadow` | Add a shadow to the app icon with a hover interaction. |
Use multiple `.hover___` options to create a sense of depth.

## App Version Options
Any scenes or views that contain `AppVersionView` support this environment value.
```swift
About {
	/* ... */
}
.appVersionOptions(/* ... */) // <-- here!
```
| Option | Description |
| - | - |
| `.copyable` | Allow the user to copy the app version to the clipboard by clicking on the label. |
| `.showBuildNumber` | Show the build number as a suffix to the semantic version.  This option also applies to the string provided by `.copyable`. |
