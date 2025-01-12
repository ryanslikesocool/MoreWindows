import _MW_Common
import SwiftUI

struct LauncherWindowLink: View {
	@Environment(\.openWindow) private var openWindow

	private let id: WindowID

	public nonisolated init(id: WindowID = .launcher) {
		self.id = id
	}

	public var body: some View {
		Button(action: buttonAction) {
			Text(.module.action.showLauncher)
		}
		.keyboardShortcut("l", modifiers: [.command, .shift])
	}
}

// MARK: - Functions

private extension LauncherWindowLink {
	func buttonAction() {
		openWindow(id: id)
	}
}
