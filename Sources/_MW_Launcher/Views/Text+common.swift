import SwiftUI

extension Text {
	nonisolated static func defaultLauncherWindowText() -> Self {
		Self(verbatim: LocalizedStringResource.module.windowTitle)
	}
}
