#if canImport(AppKit)
import LoveCore
import MoreViews
import SwiftUI

@available(macOS 14, *)
public extension LauncherWindow {
	struct Window: Scene {
		@Environment(\.openWindow) private var openWindow

		private let actions: [LauncherAction]
		private let options: Options

		public init(actions: [LauncherAction], options: Options = .default) {
			self.actions = actions
			self.options = options
		}

		public var body: some Scene {
			SwiftUI.Window("\(AppInformation.appName) Launcher", id: LauncherWindow.windowID) {
				Content(actions: actions, options: options)
					.accessWindow(onAppear: applyWindowStyle)
			}
			.defaultPosition(.center)
			.windowResizability(.contentSize)
			.windowStyle(.hiddenTitleBar)
			.commands {
				if options.contains(.menuItem) {
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
