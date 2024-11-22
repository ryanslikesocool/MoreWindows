import _MW_Common
import SwiftUI

struct LauncherWindowLink: View {
	@Environment(\.openWindow) private var openWindow

	private let id: WindowID

	nonisolated public init(id: WindowID = .launcher) {
		self.id = id
	}

	public var body: some View {
		Button(action: buttonAction, label: makeLabel)
			.keyboardShortcut("l", modifiers: [.command, .shift])
	}
}

// MARK: - Supporting Views

private extension LauncherWindowLink {
	nonisolated func makeLabel() -> some View {
		Text("ACTION.SHOW_LAUNCHER", bundle: .module)
	}
}

// MARK: - Functions

private extension LauncherWindowLink {
	func buttonAction() {
		openWindow(id: id)
	}
}
