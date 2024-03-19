import _MoreWindowsCommon
import AppKit

var aboutWindowID: String { "MoreWindows.About" }
var aboutWindowTitle: String { "About \(AppInformation.appName)" }

var aboutWindow: NSWindow? {
	NSApplication.shared.windows.first(where: { $0.identifier?.rawValue == aboutWindowID })
}
