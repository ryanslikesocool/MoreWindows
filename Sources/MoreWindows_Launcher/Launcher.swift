#if canImport(AppKit)
import OSLog
import SwiftUI

public struct Launcher<ActionArea: View>: Scene {
	@Environment(\.launcherOptions) private var launcherOptions
	@Environment(\.openWindow) private var openWindow

	private let actionArea: () -> ActionArea

	public init(@ViewBuilder actionArea: @escaping () -> ActionArea) {
		self.actionArea = actionArea
	}

	public var body: some Scene {
		SwiftUI.Window(launcherWindowTitle, id: launcherWindowID) {
			ContentView(actionArea: actionArea)
				.onAppear(perform: applyWindowStyle)
		}
		.defaultPosition(.center)
		.windowResizability(.contentSize)
		.windowStyle(.hiddenTitleBar)
		.commands {
			if launcherOptions.contains(.addMenuItem) {
				CommandGroup(before: .windowList) {
					Button("Show Launcher") {
						openWindow(id: launcherWindowID)
					}
					.keyboardShortcut("l", modifiers: [.command, .shift])
				}
				CommandGroup(replacing: .singleWindowList) { }
			}
		}
	}
}

private extension Launcher {
	func applyWindowStyle() {
		DispatchQueue.main.async {
			guard let launcherWindow else {
				Logger.launcherWindow.warning("Launcher window was missing.  The window style cannot be applied.")
				return
			}

			launcherWindow.isMovableByWindowBackground = true

			launcherWindow.standardWindowButton(.closeButton)?.isHidden = true
			launcherWindow.standardWindowButton(.miniaturizeButton)?.isHidden = true
			launcherWindow.standardWindowButton(.zoomButton)?.isHidden = true
		}
	}
}
#endif
