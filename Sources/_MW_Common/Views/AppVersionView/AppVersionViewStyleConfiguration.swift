import AppKit

public struct AppVersionViewStyleConfiguration {
	public let versionString: String

	init(versionString: String) {
		self.versionString = versionString
	}
}

// MARK: - Functions

public extension AppVersionViewStyleConfiguration {
	func copyVersionToPasteboard(withAppName includeAppName: Bool = true) {
		let copyString: String = if includeAppName {
			"\(NSApplication.shared.bundleName) \(versionString)"
		} else {
			versionString
		}

		NSPasteboard.general.clearContents()
		NSPasteboard.general.setString(copyString, forType: .string)
	}
}
