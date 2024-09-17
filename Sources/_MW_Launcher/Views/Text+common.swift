import SwiftUI

extension Text {
	static func defaultLauncherWindowText() -> Self {
		Self("WINDOW_TITLE_\(NSApplication.shared.bundleName)", bundle: .module)
	}
}
