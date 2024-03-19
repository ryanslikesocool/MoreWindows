import _MoreWindowsCommon
import AppKit

var launcherWindowID: String { "MoreWindows.Launcher" }
var launcherWindowTitle: String { "\(AppInformation.appName) Launcher" }

var launcherWindow: NSWindow? {
	NSApplication.shared.windows.first(where: { $0.identifier?.rawValue == launcherWindowID })
}
