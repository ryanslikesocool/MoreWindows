import SwiftUI

public struct CopyrightLabel: View {
	private let text: String

	public nonisolated init(text: String) {
		self.text = text
	}

	public var body: some View {
		Text(text)
	}
}

// MARK: - Convenience

public extension CopyrightLabel {
	nonisolated init?() {
		guard let text = Bundle.main.copyright else {
			return nil
		}
		self.init(text: text)
	}
}