import OSLog
import SwiftUI

/// A "Launcher" window that can be shown when an app launches.
///
/// Primary actions can be provided by using the view builder.
///
/// ## Usage
/// ```swift
/// struct MyApp: App {
/// 	var body: some Scene {
/// 		Launcher { // <-- here!
/// 			Button("Create New Documnet", systemImage: "doc.badge.plus") { /* ... */ }
/// 			Button("Open Document", systemImage: "folder") { /* ... */ }
/// 			Button("Confetti", systemImage: "sparkles") { /* ... */ }
/// 		}
/// 	}
/// }
/// ```
///
/// ## Supported Options
/// - ``LauncherWindowOptions``
/// - ``LauncherActionOptions``
/// - ``RecentItemsOptions``
/// - `_MoreWindowsCommon.AppIconOptions`
/// - `_MoreWindowsCommon.AppVersionOptions`
///
/// - Remark: For the launcher to be the initial window when opening the app, it must be the first item in `SwiftUI.App.body`.
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
