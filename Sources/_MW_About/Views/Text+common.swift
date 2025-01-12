import SwiftUI

extension Text {
	nonisolated static func defaultAboutWindowText() -> Self {
		Self(verbatim: LocalizedStringResource.module.windowTitle)
	}
}
