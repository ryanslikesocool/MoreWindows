import SwiftUI

extension Text {
	static func defaultAboutWindowText() -> Self {
		Self("WINDOW_TITLE_\(NSApplication.shared.bundleName)", bundle: .module)
	}
}