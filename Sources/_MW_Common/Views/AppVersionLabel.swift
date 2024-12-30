import SwiftUI

public struct AppVersionLabel: View {
	private let text: String

	nonisolated public init(text: String) {
		self.text = text
	}

	public var body: some View {
		Text(verbatim: text)
	}
}

// MARK: - Convenience

public extension AppVersionLabel {
	nonisolated init?(includeBundleVersion: Bool = true) {
		guard let text = Bundle.main.appVersion(includeBundleVersion: includeBundleVersion) else {
			return nil
		}
		self.init(text: text)
	}
}