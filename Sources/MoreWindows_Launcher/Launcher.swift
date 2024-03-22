import OSLog
import SwiftUI

/// A launcher window that can be shown when an app launches.
///
/// To make the launcher the initial window, it must be the first item in ``SwiftUI.App.body``.
public struct Launcher<ActionArea: View>: Scene {
	@Environment(\.launcherWindowOptions) private var launcherWindowOptions
	@Environment(\.openWindow) private var openWindow

	private let actionArea: () -> ActionArea

	/// Create a launcher scene.
	/// - Parameter actionArea: The primary action area.
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
			if launcherWindowOptions.contains(.addMenuItem) {
				CommandGroup(before: .windowList) {
					Button("Show Launcher") {
						openWindow(id: launcherWindowID)
					}
					.keyboardShortcut("l", modifiers: [.command, .shift])
				}
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
