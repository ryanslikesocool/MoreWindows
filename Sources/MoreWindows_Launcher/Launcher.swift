#if canImport(AppKit)
import MoreViews
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
				.accessWindow(onAppear: applyWindowStyle)
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

	private func applyWindowStyle(window: NSWindow) {
		window.isMovableByWindowBackground = true

		window.standardWindowButton(.closeButton)?.isHidden = true
		window.standardWindowButton(.miniaturizeButton)?.isHidden = true
		window.standardWindowButton(.zoomButton)?.isHidden = true
	}
}
#endif
