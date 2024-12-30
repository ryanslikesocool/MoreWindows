import SwiftUI

public struct AppNameLabel: View {
	private let text: String

	nonisolated public init(text: String) {
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