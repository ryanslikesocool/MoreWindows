#if canImport(AppKit)
import LoveCore
import MoreViews
import SwiftUI

@available(macOS 14, *)
public extension LauncherWindow {
	struct Window<ActionArea: View>: Scene {
		@Environment(\.launcherOptions) private var launcherOptions
		@Environment(\.openWindow) private var openWindow

		private let actionArea: () -> ActionArea

		public init(@ViewBuilder actionArea: @escaping () -> ActionArea) {
			self.actionArea = actionArea
		}

		public var body: some Scene {
			SwiftUI.Window("\(AppInformation.appName) Launcher", id: LauncherWindow.windowID) {
				ContentView(actionArea: actionArea)
					.accessWindow(onAppear: applyWindowStyle)
			}
			.defaultPosition(.center)
			.windowResizability(.contentSize)
			.windowStyle(.hiddenTitleBar)
			.commands {
				if launcherOptions.contains(.menuItem) {
					CommandGroup(before: .windowList) {
						Button("Show Launcher") {
							openWindow(id: LauncherWindow.windowID)
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
}
#endif
