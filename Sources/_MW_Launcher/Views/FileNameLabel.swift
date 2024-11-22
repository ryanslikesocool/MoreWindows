import SwiftUI

struct FileNameLabel: View {
	private let text: String

	nonisolated public init(for url: URL) {
		self.text = url
			.deletingPathExtension()
			.lastPathComponent
	}

	public var body: some View {
		Text(text)
	}
}