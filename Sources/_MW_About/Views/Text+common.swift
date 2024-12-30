import SwiftUI

extension Text {
	nonisolated static func defaultAboutWindowText() -> Self {
		Self("WINDOW_TITLE_\(Bundle.main.bundleName)", bundle: .module)
	}
}
