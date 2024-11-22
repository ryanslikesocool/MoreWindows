import SwiftUI

extension Text {
	nonisolated static func defaultLauncherWindowText() -> Self {
		Self("WINDOW_TITLE_\(Bundle.main.bundleName)", bundle: .module)
	}
}
