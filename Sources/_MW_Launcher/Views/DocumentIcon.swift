import SwiftUI
import AppKit

struct DocumentIcon: View {
	private let url: URL

	nonisolated public init(for url: URL) {
		self.url = url
	}

	public var body: some View {
		if let nsImage {
			Image(nsImage: nsImage)
				.resizable()
		} else {
			Image(systemName: "doc")
		}
	}
}

// MARK: - Properties

private extension DocumentIcon {
	nonisolated var nsImage: NSImage? {
		NSWorkspace.shared
			.icon(forFile: url.path(percentEncoded: false))
	}
}