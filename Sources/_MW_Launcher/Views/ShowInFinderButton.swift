import _MW_Common
import SwiftUI

struct ShowInFinderButton: View {
	private let url: URL

	public nonisolated init(_ url: URL) {
		self.url = url
	}

	public var body: some View {
		Button(action: buttonAction) {
			Text(.module.action.showInFinder)
		}
	}
}

// MARK: - Functions

private extension ShowInFinderButton {
	func buttonAction() {
		NSWorkspace.shared.activateFileViewerSelecting([url])
	}
}
