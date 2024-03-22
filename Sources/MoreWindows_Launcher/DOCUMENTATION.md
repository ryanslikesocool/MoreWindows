# Launcher
A launcher window.

## Usage
Use the view builder to add content to the main action area of the launcher.
```swift
struct MyApp: App {
	var body: some Scene {
		Launcher {
			Button("Create New Documnet", systemImage: "doc.badge.plus") { /* ... */ }
			Button("Open Document", systemImage: "folder") { /* ... */ }
			Button("Confetti", systemImage: "sparkles") { /* ... */ }
		}
	}
}
```

## Launcher Window Options
```swift
Launcher {
	/* ... */
}
.launcherWindowOptions(/* ... */)  // <-- here!
```
| Option | Description |
| - | - |
| `.showIcon` | Show the app icon in the "welcome" section of the window. |
| `.showName` | Show the app name in the "welcome" section of the window. |
| `.showVersion` | Show the app version in the "welcome" section of the window. |
| `.showRecentDocuments` | Show the recent documents list on the right side of the window. |
| `.addMenuItems` | Add a menu item to open the launcher. |

## Recent Items Options
```swift
Launcher {
	/* ... */
}
.recentItemsOptions(/* ... */) // <-- here!
```
| Option | Description |
| - | - |
| `.searchable` | Add a search field to the list. |
| `.showIcon` | Show the document icon next to each item. |
| `.showURL` | Show the document's URL beneath the document's name. |
| `.draggable` | Enable items to be dragged. |
| `.closeWindow` | Close the launcher upon selecting an item. |

## Launcher Action Options
```swift
Launcher {
	Button("Confetti", systemImage: "sparkles") {
		/* ... */
	}
	.launcherActionOptions(/* ... */) // <-- here!
}
```
| Option | Description |
| - | - |
| `.closeWindow` | Close the launcher window once the button action is executed. |

## Miscellaneous
The Launcher window also supports the following options
- [App Icon Options](Sources/_MoreWindowsCommon/DOCUMENTATION.md#app-icon-options)
- [App Version Options](Sources/_MoreWindowsCommon/DOCUMENTATION.md#app-version-options)
