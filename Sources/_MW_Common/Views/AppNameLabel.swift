import SwiftUI

/// A label that displays the app's name.
public struct AppNameLabel: View {
	private let text: String

	public nonisolated init(text: String) {
		self.text = text
	}

	public var body: some View {
		Text(verbatim: text)
	}
}

// MARK: - Convenience

public extension AppNameLabel {
	nonisolated init() {
		let text = Bundle.main.bundleName
		self.init(text: text)
	}
}
