import _MW_Common
import SwiftUI

struct ShowInFinderButton: View {
	private let url: URL

	public init(_ url: URL) {
		self.url = url
	}

	public var body: some View {
		Button(action: buttonAction, label: makeLabel)
	}
}

// MARK: - Supporting Views

private extension ShowInFinderButton {
	func makeLabel() -> some View {
		Text("ACTION.SHOW_IN_FINDER", bundle: .module)
	}
}

// MARK: - Functions

private extension ShowInFinderButton {
	func buttonAction() {
		NSWorkspace.shared.activateFileViewerSelecting([url])
	}
}